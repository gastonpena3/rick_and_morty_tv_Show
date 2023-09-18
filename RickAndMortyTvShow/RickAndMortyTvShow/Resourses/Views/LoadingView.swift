//
//  LoadingView.swift
//  RickAndMortyTvShow
//
//  Created by Gastón Pena on 17/09/2023.
//

import SwiftUI

struct LoadingView<Content>: View where Content: View {
    
    @Binding var isShowing: Bool
    var content: () -> Content
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                self.content()
                    .disabled(self.isShowing)
                    .blur(radius: self.isShowing ? 3 : 0)
                
                VStack {
                    //Text("Loading...")
                    ActivityIndicatorView(isAnimating: .constant(true), style: .large)
                }
                .frame(width: 100, height: 100)
                .background(Color.secondary.colorInvert())
                .foregroundColor(Color.red)
                .cornerRadius(10)
                .opacity(self.isShowing ? 1 : 0)
                
            }
        }
    }
}
