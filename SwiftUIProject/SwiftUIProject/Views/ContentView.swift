//
//  ContentView.swift
//  SwiftUIProject
//
//  Created by Consultant on 8/21/22.
//

import SwiftUI

struct ContentView<T: AnimalsListViewModelType>: View {
    
    @ObservedObject var AnimalsListVM: T
    
    var body: some View {
        // TODO: Figure out removing space at top of NavigationView
        NavigationView {
            VStack {
                Text("Animals")
                
                List {
                   
                    ForEach(0..<self.AnimalsListVM.Animals.count, id: \.self) { index in
                        NavigationLink(destination: AnimalsDetailView(AnimalsVM: self.AnimalsListVM, index: index)) {
                            AnimalsView(AnimalsListVM: self.AnimalsListVM, index: index)
                                .onAppear {
                                  
                                    self.AnimalsListVM.requestMoviesIfNeeded(index: index)
                                }
                        }
                    }
                            
                    if self.AnimalsListVM.isLoading {
                        ProgressView()
                    }
                }

            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(AnimalsListVM: AnimalsListViewModel())
    }
}
