//
//  DetailAnimalsVo.swift
//  DependencyInjectionForBeginner
//
//  Created by pavel mishanin on 05.12.2021.
//

import Foundation

class DetailAnimalsVo {
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

