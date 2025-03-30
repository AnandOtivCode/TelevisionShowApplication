//
//  MainView.swift
//  MovieDetailsApplication
//
//  Created by Anand Otiv on 2025-03-29.
//

// Title Screen

import SwiftUI

struct MainView: View {
    @State private var sheetIsShowing = false
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.6)
            VStack{
                
                Text("Anand Otiv's Shows")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(Color.green)
                    .foregroundStyle(.white)
     
                
            }
            
        }
            }
            
        }
    


#Preview {
    MainView()
}
