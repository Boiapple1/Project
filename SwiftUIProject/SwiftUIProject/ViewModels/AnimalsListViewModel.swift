//
//  AnimalsListViewModel.swift
//  SwiftUIProject
//
//  Created by Consultant on 8/21/22.
//

import Foundation
import Combine


protocol AnimalsListViewModelType: ObservableObject {
    var Animals: [animals] { get }
    var isLoading: Bool { get }
    func requestMoviesIfNeeded(index: Int)
}

class AnimalsListViewModel: AnimalsListViewModelType {
    
    private let networkService: NetworkService
    private var subs = Set<AnyCancellable>()
    @Published var Animals: [animals] = []
    @Published var isLoading: Bool = false
    
    init(network: NetworkService = NetworkManager()) {
        self.networkService = network
        self.requestMoviesIfNeeded(index: 0)
    }
    
    func requestMoviesIfNeeded(index: Int) {
        guard index == (self.Animals.count - 1) || self.Animals.isEmpty else { return }
        self.isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.requestAnimals()
        }
    }
    
    func requestAnimals() {
        self.networkService.getModel(url: NetworkParams.ZooAnimals.url)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                print(completion)
            } receiveValue: { [weak self] (animal: [animals]) in
                self?.Animals.append(contentsOf: animal)
                self?.isLoading = false
            }.store(in: &self.subs)
    }
    
    
}
