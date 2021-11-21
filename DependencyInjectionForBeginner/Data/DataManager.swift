//
//  DataManager.swift
//  DependencyInjectionForBeginner
//
//  Created by pavel mishanin on 21.11.2021.
//

import UIKit

class DataManager {
    private let storage: RemoteDataSource
    
    init(storage: RemoteDataSource) {
        self.storage = storage
    }
    
    func save() {
        storage.save()
    }
    
    func fetchMovies() -> Array<String> {
        return storage.fetchMovies()
    }
}
