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
    
    func fetchAnimals(errorClosure: @escaping () -> () ,successClosure: @escaping (Array<GenerelAnimalsVo>) -> ()) {
        remoteDataSource.fetchMovies(errorClosure: errorClosure, successClosure: { array in
            
            let converter = Converter().dtoToVo(dtoArray: array)
            successClosure(converter)
        })
    }
    
    
}
