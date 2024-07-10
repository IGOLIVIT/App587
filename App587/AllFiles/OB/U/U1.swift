//
//  U1.swift
//  App587
//
//  Created by IGOR on 09/07/2024.
//

import SwiftUI

struct U1: View {
    var body: some View {

        ZStack {
            
            Color("bgu")
                .ignoresSafeArea()
            
            VStack {
                
                Image("logo2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea()
            }
            
            VStack {
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Reviews()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 51)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    })
            }
            .padding()
        }
    }
}

#Preview {
    U1()
}
