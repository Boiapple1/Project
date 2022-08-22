//
//  SwiftUIProjectApp.swift
//  SwiftUIProject
//
//  Created by Consultant on 8/21/22.
//

import SwiftUI

@main
struct SwiftUIProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(AnimalsListVM: AnimalsListViewModel())
        }
    }
}
