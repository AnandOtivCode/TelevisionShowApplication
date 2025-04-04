//
//  TVStore.swift
//  TelevisionShowApplication
//
//  Created by Anand Otiv on 2025-04-03.
//



import Foundation

class TVStore: ObservableObject {
    
    static var exampleTVShowStore: TVStore = TVStore(favouriteTVShows: [TVShow.exampleTVShow])
    
    @Published var favouriteTVShows: [TVShow]
    
    init(favouriteTVShows: [TVShow]) {
        self.favouriteTVShows = favouriteTVShows
    }
    
    var documentDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(paths[0])
        return paths[0]
    }
    
    
    func isInCollection(tvShow: TVShow)-> Bool{
        favouriteTVShows.contains(tvShow)
    }
    
    func saveFavourites(){
        let savedLocation = documentDirectory.appendingPathComponent("favourites.json")
        
        do{
            let jsonencoder = JSONEncoder()
            let savedData = try jsonencoder.encode(favouriteTVShows)
            
            try savedData.write(to: savedLocation)
            
        } catch{
            print("Error trying to save - \(error.localizedDescription)")
        }
    }
    
    func addToFavourites(tvShow: TVShow){
        if !isInCollection(tvShow: tvShow){
            favouriteTVShows.append(tvShow)
            saveFavourites()
        }
    }
    
    
    func removeFromFavourites(usingIndexSet indexSet: IndexSet){
        favouriteTVShows.remove(atOffsets: indexSet)
        saveFavourites()
    }
    
    
    func retrieveFavourites(){
        let savedLocation = documentDirectory.appendingPathComponent("favourites.json")
        do{
            let jsondecoder = JSONDecoder()
            let fetchedData = try Data(contentsOf: savedLocation)
            favouriteTVShows = try jsondecoder.decode([TVShow].self, from: fetchedData)
            
        }catch{
            print("Error trying to decode - \(error.localizedDescription)")
        }
    }


    
    
    
}
