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
    
    
    
    func fetchMovies(errorClosure: @escaping () -> () ,successClosure: @escaping (Array<String>) -> ()) {
        delay(3) {
            let myArray = ["movie1", "movie2", "movie3"]
            if myArray.count < 5 {
                errorClosure()
            } else {
                successClosure(myArray)
            }
        }
    }
    
    private func delay(_ delay: Int, closure: @escaping () -> () ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay)) {
            closure()
        }
    }
    
    
}
