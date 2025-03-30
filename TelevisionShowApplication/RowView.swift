//
//  RowView.swift
//  TelevisionShowApplication
//
//  Created by Anand Otiv on 2025-03-28.
//

// Constructs individual row for content view
//Contains:
// Image of Episode
// Season and or Episode Number
// Episode Name
//Content Advisory Rating
//Episode Short Description


import SwiftUI


struct RowView: View {
    var tvShow: TVShow
    var body: some View {
        
        VStack{
            AsyncImage(url: URL(string: tvShow.artworkUrl100 ?? "https://picsum.photos/200")){
                result in
                
                if let image = result.image{
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height:200)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                    
                } else if result.error != nil{
                    Image(systemName: "photo")
                } else {
                    ProgressView()
                }
            }
            HStack{
                Image(systemName: "movieclapper.fill")
                    .font(.title)
                VStack(alignment: .leading){

                    Text(tvShow.collectionName ?? "No TVShow Name".uppercased())
                        .font(.title2)
                        .fontWeight(.heavy)
                    Text(tvShow.trackName ?? "No TVShow Name".uppercased())
                        .font(.title2)
                        .fontWeight(.heavy)
                      .foregroundColor(Color.red)
                    Text("Genre: \(tvShow.primaryGenreName ?? "No Primary Genre Name")")
                    Text("Content Advisory Rating: \(tvShow.contentAdvisoryRating ?? "No Content Advisory Rating")")
                    
                    //If no movie short description don't show anything
                    if tvShow.shortDescription != nil {
                        
                        Text("Episode Description : \(tvShow.shortDescription ?? "")").font(.footnote).fontWeight(.heavy).multilineTextAlignment(.leading)
                        
                    }
                    
                
                    

                    
                    
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    RowView(tvShow:TVShow.exampleTVShow)
}

