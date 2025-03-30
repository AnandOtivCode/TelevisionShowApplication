//
//  ContentView.swift
//  TelevisionShowApplication
//
//  Created by Anand Otiv on 2025-03-28.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var sheetIsShowing = false
    @State private var searchText  = "The Simpsons"
    
    
    @State private var tvShows: [TVShow] = []
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(tvShows){
                    tvshow in
                    
                    NavigationLink(destination: DetailView(tvShow: tvshow)){
                        RowView(tvShow: tvshow)
                    }
                }
            }
            .navigationTitle("TV Shows")
            .onAppear(){
                loadData(usingQuery:searchText)
            }
            .searchable(text: $searchText, prompt: "Enter two letter state code")
            .keyboardType(.default)
            .textInputAutocapitalization(.characters)
            .onSubmit(of: .search, {
                loadData(usingQuery: searchText)
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Info", systemImage: "info.circle"){
                        sheetIsShowing.toggle()
                    }
                }
            }
            .sheet(isPresented: $sheetIsShowing) {
                VStack{
                    Text("NPS Data for Your Apps, Maps, and Websites")
                        .font(.title2)
                        .bold()
                        .frame(maxWidth: .infinity , alignment: .leading)
                    Divider()
                    Text("The National Park Service API (application programming interface) and developer resources are designed to provide authoritative NPS data and content for internal and external developers creating apps, maps, and websites. You'll find photos and essential information about NPS sites including visitor centers, campgrounds, events, news, alerts, and more, as well as detailed articles about NPS natural and cultural features and important people and places.")
                        .italic()
                }.padding()
            }
        }
        
        
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
    


