//
//  DetailView.swift
//  TelevisionShowApplication
//
//  Created by Anand Otiv on 2025-03-29.
//


import SwiftUI

struct DetailView: View {
    var tvShow: TVShow
    var body: some View {
        VStack{
            Text(tvShow.trackName ?? "No Movie Name")
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            Divider()
                .fontWeight(.light)
            Text("Details")
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 10)
            Text("Synopsis : \(tvShow.longDescription ?? "No Long Description")")
            Divider()
            
            
            
            AsyncImage(url: URL(string: tvShow.artworkUrl100 ?? "No Image")){
                result in
                
                if let image = result.image{
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                    
                } else if result.error != nil{
                    Image(systemName: "photo")
                } else {
                    ProgressView()
                }
            }
            
            
        }
    }
}
    
    
        #Preview {
            DetailView(tvShow: TVShow.exampleTVShow)
        }

    
    

