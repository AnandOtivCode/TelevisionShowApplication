//
//  ContentView.swift
//  TelevisionShowApplication
//
//  Created by Anand Otiv on 2025-03-28.
//

import SwiftUI

struct ContentView: View {
    
    
    
    @State private var searchText  = "The Simpsons"
    
    
    @State private var tvShows: [TVShow] = []
    
    var body: some View {
        Text("Hello")
    }
    
    
    func loadData(usingQuery query: String){
        
        Task{
            //urlQueryAllowed?
            guard let cleanText = query.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) else { return }
            var urlString = "https://itunes.apple.com/search?term=\(cleanText)&media=tvShow"
            
            
            //            urlString = urlString.appending(API_KEY_GOES_HERE)
            
            //            print(urlString)
            
            guard let url = URL(string: urlString) else {
                return
            }
            do{
                let (data, _) =  try await URLSession.shared.data(from: url)
                let decoder = JSONDecoder()
                let results = try decoder.decode(TVShowList.self, from: data)
                tvShows.self = results.results
                
            } catch DecodingError.valueNotFound(let error, let message){
                print( "Value is missing: \(error) - \(message.debugDescription)")
            } catch DecodingError.typeMismatch(let error, let message){
                print( "Types do not match: \(error)- \(message.debugDescription)")
            } catch DecodingError.keyNotFound(let error, let message){
                print( "Incorrect property name: \(error)- \(message.debugDescription)")
            } catch {
                print( "Unknown error has occurred- \(error.localizedDescription)")
            }
        }
        
        
        
        
    }
}
    
    #Preview {
        ContentView()
    }
    


