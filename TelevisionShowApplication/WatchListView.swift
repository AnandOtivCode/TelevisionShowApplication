//
//  WatchListView.swift
//  TelevisionShowApplication
//
//  Created by Anand Otiv on 2025-04-05.
//



import SwiftUI

struct WatchListView: View {
    @ObservedObject var tvstore: TVStore

    
    //MARK: - Body Property
    var body: some View {
        //For grammar -> 1 show , 0 shows/2 or more shows
        if tvstore.favouriteTVShows.count == 1 {
            Text("WatchList \(tvstore.favouriteTVShows.count) show")
        }
        else{
            Text("WatchList \(tvstore.favouriteTVShows.count) shows")
        }
        
        
        NavigationStack{
            List{
                ForEach(tvstore.favouriteTVShows, id:\.id){
                    tvshow in
                    WatchListRowView(tvShow:tvshow)
                }.onDelete(perform: { indexSet in
                    tvstore.removeFromFavourites(usingIndexSet: indexSet)
                })
            }
        }
    }
}

#Preview {
    WatchListView(tvstore: TVStore.exampleTVShowStore)
}

