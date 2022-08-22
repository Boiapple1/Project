//
//  AnimalsDetailView.swift
//  SwiftUIProject
//
//  Created by Consultant on 8/21/22.
//

import SwiftUI

struct AnimalsDetailView<T: AnimalsListViewModelType>: View {
    @ObservedObject var AnimalsVM: T
    let index: Int
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
            AnimalsView(AnimalsListVM: self.AnimalsVM, index: index)
            Text("Animal Type: \(self.AnimalsVM.Animals[index].animalType)\nLifespan: \(self.AnimalsVM.Animals[index].lifespan)\nActive During: \(self.AnimalsVM.Animals[index].activeTime)\nDiet:\(self.AnimalsVM.Animals[index].diet)\nLength Min: \(self.AnimalsVM.Animals[index].lengthMin)\nLength Max: \(self.AnimalsVM.Animals[index].lengthMax)\nWeight Min: \(self.AnimalsVM.Animals[index].weightMin)\nWeight Max: \(self.AnimalsVM.Animals[index].weightMax)\nHabitat: \(self.AnimalsVM.Animals[index].habitat)")
            .colorMultiply(.blue)
                .fixedSize(horizontal: false, vertical: true)
                

        

    }
}

struct AnimalsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalsDetailView(AnimalsVM: AnimalsListViewModel(), index: 0)
    }
}
