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
    
    
    
    func fetchMovies(errorClosure: @escaping () -> () ,successClosure: @escaping (Array<Animal>) -> ()) {
        delay(3) { [self] in
            handleResponce(errorClosure: errorClosure, successClosure: successClosure)
        }
    }
    
    private func handleResponce(errorClosure: @escaping () -> () ,successClosure: @escaping (Array<Animal>) -> ()) {
        if getAnimals().count < 5 {
            errorClosure()
        } else {
            successClosure(getAnimals())
        }
    }
    
    private func getAnimals() -> Array<Animal> {
       return [
            Animal(id: "1", name: "monkey"),
            Animal(id: "2", name: "elephant"),
            Animal(id: "3", name: "monkey"),
            Animal(id: "4", name: "elephant"),
            Animal(id: "5", name: "monkey"),
            Animal(id: "6", name: "elephant")
        ]
    }
    
    private func delay(_ delay: Int, closure: @escaping () -> () ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay)) {
            closure()
        }
    }
}

class Animal {
    let id  : String
    let name: String
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}
