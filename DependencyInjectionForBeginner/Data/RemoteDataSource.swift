//
//  RemoteDataSource.swift
//  DependencyInjectionForBeginner
//
//  Created by pavel mishanin on 21.11.2021.
//

import UIKit

class RemoteDataSource {
    
    func save() {
        print("Save")
    }
    
    func fetchMovies() -> Array<String> {
        let myArray = ["movie1", "movie2", "movie3"]
        return myArray
    }
}
