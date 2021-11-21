//
//  RemoteDataSource.swift
//  DependencyInjectionForBeginner
//
//  Created by pavel mishanin on 21.11.2021.
//

import UIKit

class RemoteDataSource {
    
    func save(name: String) {
        print(name)
    }
    
    func fetchMovies(closure: @escaping (Array<String>) -> ()) {
        let myArray = ["movie1", "movie2", "movie3"]
         delay(3) {
            closure(myArray)
         }
    }
    
    private func delay(_ delay: Int, closure: @escaping () -> () ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay)) {
            closure()
        }
    }
    
    
}
