//
//  DataManager.swift
//  DependencyInjectionForBeginner
//
//  Created by pavel mishanin on 21.11.2021.
//

import UIKit

class DataManager {
    private let remoteDataSource: RemoteDataSource
    
    init(remoteDataSource: RemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func save(name: String) {
        remoteDataSource.save(name: name)
    }
    
    func fetchMovies(errorClosure: @escaping () -> () ,successClosure: @escaping (Array<Animal>) -> ()) {
        remoteDataSource.fetchMovies(errorClosure: errorClosure, successClosure: successClosure)
    }
}
