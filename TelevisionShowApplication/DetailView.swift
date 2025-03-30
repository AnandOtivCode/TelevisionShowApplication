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
                        .frame(width: 350, height:350)
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
            
            
            NavigationLink(destination: WebView(webText: tvShow.trackViewUrl)) {
                Label("Check out on itunes store", systemImage: "link").foregroundColor(Color.blue).fontWeight(.bold)
            }

            
            
        }
    }
}
    
    
        #Preview {
            DetailView(tvShow: TVShow.exampleTVShow)
        }

    
    

