//
//  DetailView.swift
//  TelevisionShowApplication
//
//  Created by Anand Otiv on 2025-03-29.
//
//Used for when the user clicks on a row view
//Displays:
//Episode Long Description
//Episode Picture
//Advisory Rating and Advisory Rating Picture
//Link to Itunes Store

import SwiftUI

struct DetailView: View {
    @ObservedObject var tvstore: TVStore
    
    //MARK: - State properties
    @State private var isAlertShowing = false
    
    
    //MARK: - Properties
    var tvShow: TVShow
    var body: some View {
        NavigationStack{
            VStack{
                Text(tvShow.trackName ?? "No Track Name")
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: .infinity)
                
                Text(tvShow.collectionName ?? "No Collection Name")
                Divider()
                    .fontWeight(.light)
                Text("Details")
                    .font(.title2)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                ScrollView{
                    Text("\(tvShow.longDescription ?? "No Long Description")")
                        .frame(maxWidth: .some(360))
                }
                Divider()
                
                AsyncImage(url: URL(string: tvShow.artworkUrl100 ?? "No Image")){
                    result in
                    
                    if let image = result.image{
                        image
                            .resizable()
                            .frame(width: 250, height:250)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                        
                    } else if result.error != nil{
                        Image(systemName: "photo")
                    } else {
                        ProgressView()
                    }
                }
                
                
                //Check if Content Advisory Rating is explicit or not
                if tvShow.contentAdvisoryRating == "TV-MA" {
                    Image(systemName: "exclamationmark.triangle.fill").resizable().frame(width:50,height:50).foregroundColor(.red)
                    
                } else {
                    Image(systemName: "figure.and.child.holdinghands").resizable().frame(width:50,height:50)
                    
                }
                
                Text("Rating: \(tvShow.contentAdvisoryRating ?? "NR")")
                    .multilineTextAlignment(.leading)
                    .padding(.leading)
                
                
                Divider()
                
                
                
                NavigationLink(destination: WebView(webText: tvShow.trackViewUrl)) {
                    Label("Check out on itunes store", systemImage: "link").foregroundColor(Color.blue).fontWeight(.bold)
                }                //Adds heart and toggles between full heart and empty heart for showing whether a tvshow is favourited
            }.toolbar{
                
                //Heart is filled or not filled depending on whether item is or is not in watchlist
                ToolbarItem(placement: .navigationBarTrailing){
                    if !tvstore.isInCollection(tvShow:tvShow){
                        Button("Add", systemImage: "heart"){
                            isAlertShowing.toggle()
                        }
                    }else{
                        Button("Remove", systemImage: "heart.fill"){
                            isAlertShowing.toggle()
                        }
                    }
                    
                }
            }
        
          //  Dialouge for user to add, or not add item to watchlist
                .alert("Change Confirmation", isPresented: $isAlertShowing) {
                    
                    if !tvstore.isInCollection(tvShow:tvShow){
                        Button("Add", systemImage: "heart"){
                            tvstore.addToFavourites(tvShow: tvShow)
                        }
                    }
                    else {
                        Button("Remove", role: .destructive){
                            tvstore.removeFromFavourites(tvshow:tvShow)
                        }
                    }
                    Button("Cancel", role: .cancel){
                        
                    }
                } message: {
                    Text("Do you want to make these changes for \(tvShow.trackName ?? "" )?")
                }
                    
                    
                    
                }
                
            }
        }
        
    
    
        #Preview {
            DetailView(tvstore: TVStore.exampleTVShowStore, tvShow: TVShow.exampleTVShow)
        }

    
    

