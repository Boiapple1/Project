//
//  AnimalsVIew.swift
//  SwiftUIProject
//
//  Created by Consultant on 8/21/22.
//

import SwiftUI

struct AnimalsView<T: AnimalsListViewModelType>: View {
    
    @ObservedObject var AnimalsListVM: T
    let index: Int
    
    var body: some View {
        
        VStack {
            AsyncImage(url: NetworkParams.AnimalPic(self.AnimalsListVM.Animals[index].imageLink ).url) { realImage in
                realImage
                    .resizable()
                    .frame(width: 300, height: 250, alignment: .center)
            } placeholder: {
                ProgressView()
                    .frame(width: 300, height: 250, alignment: .center)
            }
                .padding([.top, .bottom, .trailing], 8)
            VStack{
            Text("Name:\n\(AnimalsListVM.Animals[index].name)\n\nLatin Name:\n\(AnimalsListVM.Animals[index].latinName)")
                    .fixedSize(horizontal: false, vertical: true)
//          
            }
                .padding([.top, .bottom, .trailing], 8)
        }
        
        .listRowInsets(EdgeInsets(top: 0, leading: 2, bottom: 0, trailing: 0))
    }
    
}


struct AnimalsView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalsView(AnimalsListVM: AnimalsListViewModel(), index: 0)
    }
}
