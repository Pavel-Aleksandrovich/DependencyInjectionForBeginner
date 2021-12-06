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
    
    
    
    func fetchMovies(errorClosure: @escaping () -> () ,successClosure: @escaping (Array<AnimalDto>) -> ()) {
        delay(3) { [self] in
            handleResponce(errorClosure: errorClosure, successClosure: successClosure)
        }
    }
    
    private func handleResponce(errorClosure: @escaping () -> () ,successClosure: @escaping (Array<AnimalDto>) -> ()) {
        if getAnimals().count < 1 {
            errorClosure()
        } else {
            successClosure(getAnimals())
        }
    }
    
    private func getAnimals() -> Array<AnimalDto> {
        return [
            AnimalDto(id: "1995", name: "Pavel", avatar: "The best", age: 26, weight: 70),
            AnimalDto(id: "reg", name: "ger", avatar: "egr", age: 43, weight: 2027)
        ]
    }
    
    private func delay(_ delay: Int, closure: @escaping () -> () ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay)) {
            closure()
        }
    }
}

class AnimalDto {
    let id  : String
    let name: String
    let avatar: String
    let age: Int
    let weight: Int
    
    init(id: String, name: String, avatar: String, age: Int, weight: Int) {
        self.id = id
        self.name = name
        self.age = age
        self.avatar = avatar
        self.weight = weight
    }
}
