//
//  ViewController.swift
//  MoviesMVVM6.28
//
//  Created by iAskedYou2nd on 7/19/22.
//

import UIKit

/*
    1. Fix Image issue
    
 */

class ViewController: UIViewController {

    lazy var movieTableView: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.prefetchDataSource = self
        table.backgroundColor = .magenta
        table.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.reuseId)
        return table
    }()
    
    let movieVM: MovieViewModelType
    
    init(vm: MovieViewModelType) {
        self.movieVM = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        
        print("Test: 1")
        
        self.movieVM.bind {
            print("Test: 2")
            DispatchQueue.main.async {
                self.movieTableView.reloadData()
            }
        }
        
        print("Test: 3")
        self.movieVM.getMovies()
        
    }
    
    // MARK: Just for showcasing UITests
    lazy var uiTestButton: UIButton = {
        let button = UIButton(configuration: .bordered(), primaryAction: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("UITestButton", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(self.uiButtonPressed), for: .touchUpInside)
        button.accessibilityIdentifier = "Button That Navigates to the Detail Screen"
        return button
    }()
    
    private func setUpUI() {
        self.title = "Movies"
        self.view.backgroundColor = .white
        
        self.view.addSubview(self.movieTableView)
        self.view.addSubview(self.uiTestButton)
        
        self.movieTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        self.movieTableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.movieTableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        self.movieTableView.bottomAnchor.constraint(equalTo: self.uiTestButton.topAnchor, constant: -8).isActive = true
        
        self.uiTestButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.uiTestButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        self.uiTestButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        
        self.uiTestButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
    }
    
    @objc
    func uiButtonPressed() {
        let detail = DetailViewController()
        self.navigationController?.pushViewController(detail, animated: true)
    }


}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.reuseId, for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(movieVM: self.movieVM, index: indexPath.row)
        
        return cell
    }
}


extension ViewController: UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        let lastIndexPath = IndexPath(row: self.movieVM.count - 1, section: 0)
        guard indexPaths.contains(lastIndexPath) else { return }
        self.movieVM.getMovies()
    }
    
    
}
