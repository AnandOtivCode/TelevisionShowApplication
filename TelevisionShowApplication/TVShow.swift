//
//  Movie.swift
//  MovieDetailsApplication
//
//  Created by Anand Otiv on 2025-03-28.
//

//Class for decoding and reading JSON movie file and putting into Movie
import Foundation

struct TVShowList: Codable {
    var results: [TVShow]
}


struct TVShow:Codable, Hashable,Identifiable{


//Stores Example Tv Show

    static let exampleTVShow = TVShow(trackId: 299552684,
        trackName:"Lost Verizon",
        viewUrl: "https://video-ssl.itunes.apple.com/itunes-assets/Video211/v4/38/62/34/38623413-7ed2-ef77-8620-b702f41c32d3/mzvf_12497877310228884860.640x480.h264lc.U.p.m4v",
        artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Video118/v4/d9/02/a7/d902a77a-2557-e2b2-bdbc-fc1a274990a1/mzl.hbjjaqku.lsr/100x100bb.jpg",
        collectionName:"The Simpsons, Season 20",
    trackViewUrl:"https://itunes.apple.com/us/tv-season/treehouse-of-horror-xix/id299364989?i=299758136&uo=4",
        country: "USA",
        contentAdvisoryRating: "TV-PG",
        trackExplicitness:"notExplicit",
        primaryGenreName: "Comedy",
        shortDescription: "Bart makes the ultimate prank call.",
        longDescription: "In order to save up money to buy a cell phone, Bart takes a job at a country club retrieving golf balls. While at the course, Bart watches celebrities, including Leary playing a round. When Leary's cell phone rings just as he is about to take a swing, he furiously throws the phone in the air and it lands right next to Bart. Bart decides to keep the cell and makes prank calls to all over the world pretending to be Leary. He even accepts a job offer from famed producer Grazer to star in the film version of \"Everyone Poops.\" When Marge discovers what Bart has been up to, she confiscates the device and calls Leary to return the phone. But Leary has a better idea, and instructs Marge to activate the GPS system on the phone so she can track Bart's every move. Bart quickly catches on and devises a plan that sends the family on a wild goose chase all the way to Machu Picchu.")
    
    
    

    var trackId:Int? = 0
    var trackName: String?
    //var artistName:String? = nil
    var viewUrl: String? = nil
    var artworkUrl100: String?
    var collectionName: String?
    var artistName: String?
    var trackViewUrl: String?
    var country: String?
    var contentAdvisoryRating: String?
    var trackExplicitness: String?
    var primaryGenreName: String?
    var trackPrice : Double? = 0.0
    var trackRentalPrice: Double? = 0.0
    var shortDescription:String? = nil
    var longDescription:String?
    
    //For adhering to Identifiable Protocol
    var id: Int { trackId ?? 0}

    
    
}



//extension Bundle {
//    func decode(_ file: String) -> [TVShow] {
//        guard let url = self.url(forResource: file, withExtension: "json") else {
//            fatalError("Can't locate this file")
//        }
//        guard let data = try? Data(contentsOf: url) else {
//            fatalError("Can't convert the url to data")
//        }
//        guard let TVShowList = try? JSONDecoder().decode(TVShowList.self, from: data) else {
//            fatalError("Can't decode - problem with keys and properties or values")
//        }
//        
//        return TVShowList.results
//    }
//}






