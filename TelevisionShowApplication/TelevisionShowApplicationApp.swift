//
//  TelevisionShowApplicationApp.swift
//  TelevisionShowApplication
//
//  Created by Anand Otiv on 2025-03-28.
//

import SwiftUI

@main
struct TelevisionShowApplicationApp: App {
    @StateObject private var tvstore = TVStore(favouriteTVShows: [])

    var body: some Scene {
        WindowGroup {
            TabView{
                Tab("TVShow search", systemImage: "magnifyingglass"){
                    ContentView(tvstore:tvstore)
                }
                //                Tab("Favourite TVShows", systemImage: "tent"){
                //                    FavouriteCampsitesView(campstore: campstore)
                //                }.badge(campstore.favouriteCampsites.count)
                //
                //            }.onAppear(){
                //                campstore.retrieveFavourites()
                
                
            }
                
        }
    }
}
