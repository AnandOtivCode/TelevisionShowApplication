//
//  RowView.swift
//  TelevisionShowApplication
//
//  Created by Anand Otiv on 2025-03-28.
//



import SwiftUI


struct RowView: View {
    var tvShow: TVShow
    var body: some View {
        
        HStack{
            Image(systemName: "movieclapper.fill")
                .font(.title)
            VStack(alignment: .leading){
//                Text(movie.trackId)
//                    .font(.headline)
                Text(tvShow.trackName ?? "No Movie Name".uppercased())
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.red)
                Text(tvShow.shortDescription ?? "")
                Text("Genre Name: \(tvShow.primaryGenreName ?? "No Primary Genre Name")")
                Text("Content Advisory Rating: \(tvShow.contentAdvisoryRating ?? "No Content Advisory Rating")")
                
                //If no movie short description don't show anything
                if tvShow.shortDescription != nil {
                    
                    Text("Movie Description : \(tvShow.shortDescription ?? "")").font(.footnote).fontWeight(.heavy).multilineTextAlignment(.leading)
                    
                }
                
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    RowView(tvShow:TVShow.exampleTVShow)
}

