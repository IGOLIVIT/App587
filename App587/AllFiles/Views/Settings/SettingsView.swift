//
//  SettingsView.swift
//  App587
//
//  Created by IGOR on 09/07/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Settings")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        Button(action: {
                            
                            SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "star")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 17, weight: .semibold))
                                
                                Text("Rate Us")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .semibold))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.white.opacity(0.4))
                                    .font(.system(size: 15, weight: .semibold))
                            }
                            .padding()
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2").opacity(0.4)))
                        })
                        
                        Button(action: {
                            
                            guard let url = URL(string: "https://www.termsfeed.com/live/ce6377c3-abe4-4629-8ecb-4012957438cc") else { return }
                            
                            UIApplication.shared.open(url)
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "doc.text")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 17, weight: .semibold))
                                
                                Text("Usage Policy")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .semibold))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.white.opacity(0.4))
                                    .font(.system(size: 15, weight: .semibold))
                            }
                            .padding()
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2").opacity(0.4)))
                        })
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                }
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
