//
//  ViewControllerViewModel.swift
//  DependencyInjectionForBeginner
//
//  Created by pavel mishanin on 21.11.2021.
//

import UIKit

final class AnimalPresenter {
    private let dataManager: DataManager
    weak var listViewController: AnimalListViewController?

    init(dataManager: DataManager) {
        self.dataManager = dataManager
    }
    
    let title = "ListViewController"
    
    func save() {
        let name: String = "test"
        dataManager.save(name: name)
    }
    
    func fetchAnimals(errorClosure: @escaping () -> () ,successClosure: @escaping (Array<GenerelAnimalsVo>) -> ()) {
        dataManager.fetchAnimals(errorClosure: errorClosure, successClosure: successClosure)
    }
    
}
