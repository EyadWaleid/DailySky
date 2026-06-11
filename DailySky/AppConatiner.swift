//
//  AppConatiner.swift
//  DailySky
//
//  Created by Eyad waleed on 11/06/2026.

import Foundation

final class DIContainer {
    
    static let shared = DIContainer()
    
    private init() {}
    
    lazy var coreDataController: CoreDataController = {
        .shared
    }()
    
    lazy var remoteHomeService: RemoteHomeServiceProtcol = {
        RemoteHomeService()
    }()
    
    lazy var localHomeService: LocalHomeService = {
        LocalHomeService()
    }()
    
    lazy var homeRepository: HomeRepoProtocol = {
        HomeRepository(
            remoteService: remoteHomeService,
            localService: localHomeService
        )
    }()
    
    @MainActor
    func makeHomeViewModel() -> HomeViewModel {
        HomeViewModel(repository: homeRepository)
    }
}
