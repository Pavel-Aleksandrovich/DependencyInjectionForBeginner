//
//  Converter.swift
//  DependencyInjectionForBeginner
//
//  Created by pavel mishanin on 05.12.2021.
//

import Foundation

final class Converter {
    func dtoToVo(dtoArray: Array<AnimalDto>) -> Array<GenerelAnimalsVo> {
        var newGeneralAnimals = [GenerelAnimalsVo]()
        
        for dto in dtoArray {
            let generalAnimal = convert(source: dto)
            newGeneralAnimals.append(generalAnimal)
        }
        return newGeneralAnimals
    }
    
    private func convert(source: AnimalDto) -> GenerelAnimalsVo {
        return GenerelAnimalsVo(id: source.id, name: source.name, avatar: source.avatar)
    }
}

protocol BaseConverter {
    
    func convertArray<S, R>(sourceArray: Array<S>) -> Array<R>
    
    func convert<S, R>(source: S) -> R
    
}
