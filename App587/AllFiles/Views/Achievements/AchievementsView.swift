//
//  AchievementsView.swift
//  App587
//
//  Created by IGOR on 09/07/2024.
//

import SwiftUI

struct AchievementsView: View {
    
    @StateObject var viewModel = AchievementsViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Achievements")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddAch = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "square.and.pencil")
                                .foregroundColor(.green)
                                .font(.system(size: 18, weight: .semibold))
                        })
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        
                        ZStack {
                            
                            VStack(spacing: 12) {
                                
                                Text("\(viewModel.runs)/\(viewModel.awards)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 32, weight: .semibold))
                                
                                Text("Awards")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                            }
                            
                            Circle()
                                .stroke(Color.gray.opacity(0.2), lineWidth: 8)
                                .frame(width: 140, height: 140)
                                .padding()
                            
                            Circle()
                                .trim(from: 0, to: CGFloat(calculatePercentage() / 100))
                                .stroke(Color("prim"), lineWidth: 8)
                                .frame(width: 140, height: 140)
                                .rotationEffect(.degrees(-90))
                            
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                    
                    HStack {
                        
                        VStack(alignment: .leading) {
                            
                            Image("flags")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35)
                            
                            Spacer()
                            
                            Text("\(viewModel.runs)")
                                .foregroundColor(.white)
                                .font(.system(size: 28, weight: .semibold))
                            
                            Text("Number of runs")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 150)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                        
                        VStack(alignment: .leading) {
                            
                            Image("kubok")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25)
                            
                            Spacer()
                            
                            Text("\(viewModel.awards)")
                                .foregroundColor(.white)
                                .font(.system(size: 28, weight: .semibold))
                            
                            Text("Awards received")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 150)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                        
                    }
                    
                    HStack {
                        
                        VStack(alignment: .leading) {
                            
                            Image("clock")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25)
                            
                            Spacer()
                            
                            Text("\(viewModel.best)")
                                .foregroundColor(.white)
                                .font(.system(size: 28, weight: .semibold))
                            
                            Text("Best result")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 150)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                        
                        VStack(alignment: .leading) {
                            
                            Image("timer")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25)
                            
                            Spacer()
                            
                            Text("\(viewModel.speed)")
                                .foregroundColor(.white)
                                .font(.system(size: 28, weight: .semibold))
                            
                            Text("ABest speed (km/h)")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 150)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                        
                    }
                }
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isAddAch, content: {
            
            AddAchievent(viewModel: viewModel)
        })
    }
    
    func calculatePercentage() -> Double {
        
        let value = viewModel.runs
        let maxValue = viewModel.awards
        
        let percentCircle = Double(value) / (Double(maxValue) ?? 1) * 100
        
        return percentCircle
    }
}

#Preview {
    AchievementsView()
}
