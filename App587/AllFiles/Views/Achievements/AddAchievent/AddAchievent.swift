//
//  AddAchievent.swift
//  App587
//
//  Created by IGOR on 09/07/2024.
//

import SwiftUI

struct AddAchievent: View {
    
    @StateObject var viewModel: AchievementsViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Add a achievements")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .regular))
                                
                                Text("Back")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .regular))
                            }
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            
                            viewModel.awards = Int(viewModel.addAward) ?? 0
                            viewModel.runs = Int(viewModel.addRuns) ?? 0
                            viewModel.best = viewModel.addBest
                            viewModel.speed = viewModel.addSpeed
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddAch = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                    }
                }
                .padding(.vertical)
                .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    Text("Total awards")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addAward.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.addAward)
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                    
                    Text("Numver of runs")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addRuns.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.addRuns)
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                    
                    Text("Best result")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("00:00:00")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addBest.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.addBest)
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                    
                    Text("Best speed (km/h)")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("00,00")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addSpeed.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.addSpeed)
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                    
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddAchievent(viewModel: AchievementsViewModel())
}
