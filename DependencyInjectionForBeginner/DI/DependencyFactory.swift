//
//  DependencyFactory.swift
//  DependencyInjectionForBeginner
//
//  Created by pavel mishanin on 21.11.2021.
//

import UIKit

final class DependencyFactory {
    
    func provideViewModel() -> ViewControllerViewModel {
        let storage = RemoteDataSource()
        let dataManager = DataManager(storage: storage)
        let viewModel = ViewControllerViewModel(dataManager: dataManager)
        return viewModel
    }
    
}
