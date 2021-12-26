//
//  DependencyFactory.swift
//  DependencyInjectionForBeginner
//
//  Created by pavel mishanin on 21.11.2021.
//

import UIKit

final class DependencyFactory {
    
    func provideViewModel() -> AnimalPresenter {
        let remoteDataSource = RemoteDataSource()
        let dataManager = DataManager(remoteDataSource: remoteDataSource)
        let viewModel = AnimalPresenter(dataManager: dataManager)
        return viewModel
    }
    
}
