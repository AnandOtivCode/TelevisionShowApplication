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
        Text("WatchList \(tvstore.favouriteTVShows.count) show")
        //TODO: - LOAD FAVOURITES
        
        NavigationStack{
            List{
                ForEach(tvstore.favouriteTVShows, id:\.id){
                    tvshow in
                    RowView(tvShow:tvshow)
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

