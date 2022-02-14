//
//  MatrixRainView.swift
//  MatrixRainEffect
//
//  Created by Denis Malyavin on 14.02.2022.
//

import SwiftUI

struct MatrixRainView: View {
    
    var body: some View {
        
        GeometryReader{proxy in
            let size = proxy.size
            
            HStack(spacing: 15) {
//                MatrixRainCharacters(size: size)
                ForEach(1...Int(size.width / 25), id: \.self) { _ in
                    MatrixRainCharacters(size: size)
                }
            }
            .padding(.horizontal)
            
        }
    }
}

struct MatrixRainCharacters: View {
    var size: CGSize
    
    // MARK: Animation Properties
    @State var startAnimation: Bool = false
    
    @State var random: Int = 0
    
    var body: some View {
        
        let randomHeight : CGFloat = .random(in: (size.height / 2)...size.height)
        
        VStack {
             
            // MARK: Iterating String
            ForEach(0 ..< constant.count, id:  \.self) {index in
                 
                let character = Array(constant)[getRandomIndex(index: index)]
                
                Text(String(character))
                    .font(.custom("matrixcodenfi", size: 25))
                    .foregroundColor(Color("Green"))
            }
        }
        .mask(alignment: .top) {
            Rectangle()
                .fill(
                    LinearGradient(colors: [
                        .clear,
                        .black.opacity(0.1),
                        .black.opacity(0.2),
                        .black.opacity(0.3),
                        .black.opacity(0.5),
                        .black.opacity(0.7),
                    ], startPoint: .top, endPoint: .bottom)
                )
                .frame(height: size.height / 2)
                .offset(y: startAnimation ? size.height : -randomHeight)
        }
        .onAppear() {
            withAnimation(.linear(duration: 12).delay(.random(in: 0...2)).repeatForever(autoreverses: false)) {
                startAnimation = true
            }
        }
        .onReceive(Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()) { _ in
            
            random = Int.random(in: 0 ..< constant.count)
            
        }
    }
    
    func getRandomIndex(index: Int) -> Int {
        
        let max = constant.count - 1
        
        if (index + random) > max {
            if (index - random) < 0 {
                return index
            }
            return (index - random)
        }
        else {
            return (index + random)
        }
        
    }
}

struct MatrixRainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewInterfaceOrientation(.portrait)
            ContentView()
                .previewInterfaceOrientation(.portrait)
        }
    }
}


// MARK: Random Characters
let constant = "biun7n8n8g7y990mhyff%$&%*()(M)HVY1q=+zxac//[;''gbf*T(G)M)hbbkh"
