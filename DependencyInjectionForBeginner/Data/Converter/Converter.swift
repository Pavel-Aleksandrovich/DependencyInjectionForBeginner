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
            let generalAnimal = GenerelAnimalsVo(id: dto.id, name: dto.name, avatar: dto.avatar)
            newGeneralAnimals.append(generalAnimal)
        }
        return newGeneralAnimals
    }
}
