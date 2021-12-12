//
//  Converter.swift
//  DependencyInjectionForBeginner
//
//  Created by pavel mishanin on 05.12.2021.
//

import Foundation

final class Converter: BaseConverter {
    
    func convert(source: AnimalDto) -> GenerelAnimalsVo {
        return GenerelAnimalsVo(id: source.id, name: source.name, avatar: source.avatar)
    }
    
    func convertArray(sourceArray: Array<AnimalDto>) -> Array<GenerelAnimalsVo> {
        var newGeneralAnimals = [GenerelAnimalsVo]()
        
        for dto in sourceArray {
            let generalAnimal = convert(source: dto)
            newGeneralAnimals.append(generalAnimal)
        }
        return newGeneralAnimals
    }
}

protocol BaseConverter {
    
    associatedtype S
    associatedtype R
    
    func convertArray(sourceArray: Array<S>) -> Array<R>
    
    func convert(source: S) -> R
}
