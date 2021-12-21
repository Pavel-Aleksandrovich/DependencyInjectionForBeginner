//
//  RemoteDataSource.swift
//  DependencyInjectionForBeginner
//
//  Created by pavel mishanin on 21.11.2021.
//

import UIKit

class RemoteDataSource {
    static let shared = RemoteDataSource()
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
            AnimalDto(id: "1995", name: "Mr. Pavel", avatar: "The best", age: 26, weight: 70),
            AnimalDto(id: "2003", name: "Mr. Black", avatar: "The worse", age: 18, weight: 55),
            AnimalDto(id: "2010", name: "Mr. Ivan", avatar: "Good", age: 11, weight: 37)
        ]
    }
    
    private func delay(_ delay: Int, closure: @escaping () -> () ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay)) {
            closure()
        }
    }
    func jsonDecod() -> [AnimalDTO2] {
        let path = Bundle.main.url(forResource: "Example", withExtension: "json")
        let data = try? Data(contentsOf: path!)
        //try? Data(contentsOf: URL(fileURLWithPath: path!), options: .mappedIfSafe)
        let jsonResult = try? JSONSerialization.jsonObject(with: data!, options: .mutableLeaves)
        let result = try? JSONDecoder().decode([AnimalDTO2].self, from: data!)
            // do stuff
//            print(data)
//            print(jsonResult)
//            print(result)
            return result!
    }
    
}
struct AnimalDTO2: Codable{
    let name: String
    let id: String
}

class AnimalDto: Codable {
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
