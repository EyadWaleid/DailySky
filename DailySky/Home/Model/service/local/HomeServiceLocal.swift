import Foundation
import Combine
import CoreData

final class LocalHomeService: LocalHomeServiceProtocol {
    
    private let subject = CurrentValueSubject<HomeWeatherEntitiy?, Never>(nil)
    private var context: NSManagedObjectContext {
        CoreDataController.shared.container.viewContext
    }
    
    init() { fetchAndPublish() }
    
    func saveHomeWeatherData(homeData: WeatherResponse) {
        let weather = fetchExistingWeather() ?? HomeWeatherEntitiy(context: context)
        weather.location      = makeLocation(from: homeData)
        weather.currentWeather = makeCurrent(from: homeData, existing: weather.currentWeather)
        weather.forecastArray  = NSSet(array: makeForecastDays(from: homeData))
        save()
    }
    
    func loadHomeWeatherData() -> AnyPublisher<HomeWeatherEntitiy?, Never> {
        subject.eraseToAnyPublisher()
    }
    
    private func makeLocation(from response: WeatherResponse) -> LocationEntity {
        let entity = fetchExistingWeather()?.location ?? LocationEntity(context: context)
        entity.cityName = response.location.name
        entity.country  = response.location.country
        entity.region   = response.location.region
        return entity
    }
    private func makeCurrent(from response: WeatherResponse, existing: CurrentWeatherEntity?) -> CurrentWeatherEntity {
        let entity            = existing ?? CurrentWeatherEntity(context: context)
        entity.temp           = response.currentWeather.tempC
        entity.isDay = Int16(response.currentWeather.isDay)
        print("isday = \(response.currentWeather.isDay)")
        entity.humidity       = Int32(response.currentWeather.humidity)
        entity.windKph        = response.currentWeather.windKph
    
        entity.uv             = response.currentWeather.uv
        entity.pressure = response.currentWeather.pressureMb
        entity.conditionText  = response.currentWeather.condition.text
        entity.conditionIcon  = response.currentWeather.condition.icon
        print("the Uv is \(entity.uv)")
        print("the Pressure is \(entity.pressure)")
        return entity
    }
    
    private func makeForecastDays(from response: WeatherResponse) -> [ForecastDayEntity] {
        if let existing = fetchExistingWeather()?.forecastArray as? Set<ForecastDayEntity> {
            existing.forEach { context.delete($0) }
        }

        let allHours  = response.forecast.forecastday.flatMap { $0.hour }
        let firstDate = response.forecast.forecastday[0].date
        var seenDates = Set<String>()

        return allHours.compactMap { hour -> ForecastDayEntity? in
            let date = String(hour.time.prefix(10))
            guard date != firstDate         else { return nil }
            guard !seenDates.contains(date) else { return nil }
            seenDates.insert(date)
            return makeForecastDay(hour: hour, date: date, forecastDays: response.forecast.forecastday)
        }
    }
    
    private func makeForecastDay(hour: Hour, date: String, forecastDays: [ForecastDay]) -> ForecastDayEntity {
        let matchedDay   = forecastDays.first { $0.date == date }
        let entity       = ForecastDayEntity(context: context)
        entity.day       = date
        entity.temp      = hour.tempC
        entity.maxTemp   = matchedDay?.day.maxtempC ?? 0
        entity.minTemp   = matchedDay?.day.mintempC ?? 0
        entity.conditionText = hour.condition.text
        entity.conditionIcon = hour.condition.icon
        entity.humidity  = Int32(hour.humidity)
        entity.uv        = hour.uv
        entity.windSpeed = hour.windKph
        entity.pressure = hour.pressureMb
        return entity
    }
    
    private func save() {
        try? context.save()
        fetchAndPublish()
    }
    
    private func fetchAndPublish() {
        let weather = try? context.fetch(HomeWeatherEntitiy.fetchRequest()).first
        subject.send(weather)
    }
    
    private func fetchExistingWeather() -> HomeWeatherEntitiy? {
        try? context.fetch(HomeWeatherEntitiy.fetchRequest()).first
    }
}
