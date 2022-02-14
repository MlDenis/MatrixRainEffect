//
//  ContentView.swift
//  MatrixRainEffect
//
//  Created by Denis Malyavin on 14.02.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack{
            
            Color.black
            
            MatrixRainView()
        }
        .ignoresSafeArea()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
