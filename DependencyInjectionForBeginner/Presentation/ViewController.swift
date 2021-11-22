//
//  ViewController.swift
//  DependencyInjectionForBeginner
//
//  Created by pavel mishanin on 20.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private let label = UILabel()
    private let activityIndicatorView = UIActivityIndicatorView()
    private let viewModel = DependencyFactory().provideViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = viewModel.title
        view.backgroundColor = .green
        viewModel.save()
        showLoader()
        initLabel()
        
    }
    
    private func activityIndicator() {
        activityIndicatorView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        activityIndicatorView.color = .red
        activityIndicatorView.center = view.center
        activityIndicatorView.startAnimating()
        view.addSubview(activityIndicatorView)
    }
    
    private func initLabel() {
        label.frame = CGRect(x: 0, y: 0, width: 300, height: 100)
        label.center = view.center
        view.addSubview(label)
        
        viewModel.fetchMovies(){ movies in
            self.label.text = "\(movies)"
            print(movies)
            self.hideLoader()
        }
    }
    
    private func showLoader() {
        activityIndicator()
        
    }
    
    private func hideLoader() {
        activityIndicatorView.stopAnimating()
    }
    
}








