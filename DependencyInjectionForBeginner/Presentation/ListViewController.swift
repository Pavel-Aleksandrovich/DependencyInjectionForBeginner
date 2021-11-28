//
//  ViewController.swift
//  DependencyInjectionForBeginner
//
//  Created by pavel mishanin on 20.11.2021.
//

import UIKit

class ListViewController: UIViewController {
    
    private let alert = UIAlertController(title: nil, message: "Please Wait ...", preferredStyle: .alert)
    private let label = UILabel()
    private let activityIndicatorView = UIActivityIndicatorView()
    private let viewModel = DependencyFactory().provideViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = viewModel.title
        view.backgroundColor = .red
        viewModel.save()
        showLoader()
        initLabel()
        
    }
    
    private func alerActivityIndicator() {
        let loader = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loader.hidesWhenStopped = true
        loader.style = .large
        loader.startAnimating()
        alert.view.addSubview(loader)
        present(alert, animated: true, completion: nil)
    }
    
    private func activityIndicator() {
        activityIndicatorView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        activityIndicatorView.color = .black
        activityIndicatorView.style = .large
        activityIndicatorView.center = view.center
        activityIndicatorView.startAnimating()
        view.addSubview(activityIndicatorView)
    }
    
    private func initLabel() {
        label.frame = CGRect(x: 0, y: 0, width: 300, height: 100)
        label.center = view.center
        view.addSubview(label)
        
//        viewModel.fetchMovies(){ movies in
//            self.label.text = "\(movies)"
//            print(movies)
//            self.hideLoader()
//        }
        viewModel.fetchMovies(errorClosure: {
            // show alert error
            // hide loader
        }, successClosure: { [ weak self ] movies in
            self?.label.text = "\(movies)"
            print(movies)
            self?.hideLoader()
        })
        
    }
    
    private func showLoader() {
//        activityIndicator()
        alerActivityIndicator()
    }
    
    private func hideLoader() {
        activityIndicatorView.stopAnimating()
        alert.dismiss(animated: false, completion: nil)
    }
    
}








