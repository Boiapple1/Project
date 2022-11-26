//
//  MoviesSwiftUI6_28App.swift
//  MoviesSwiftUI6.28
//
//  Created by iAskedYou2nd on 8/18/22.
//

import SwiftUI

@main
struct MoviesSwiftUI6_28App: App {
    var body: some Scene {
        WindowGroup {
            ContentView(movieListVM: MovieListViewModel())
        }
    }
}
