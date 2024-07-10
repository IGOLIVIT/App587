//
//  LoadingView.swift
//  App587
//
//  Created by IGOR on 09/07/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("Llogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300)
                    .padding(.bottom, 100)
                
                ProgressView()
            }
        }
    }
}

#Preview {
    LoadingView()
}
