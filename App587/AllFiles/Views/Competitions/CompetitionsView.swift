//
//  CompetitionsView.swift
//  App587
//
//  Created by IGOR on 09/07/2024.
//

import SwiftUI

struct CompetitionsView: View {

    @StateObject var viewModel = CompetitionsViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = true
                    }
                    
                }, label: {
                    
                    Image(systemName: "plus")
                        .foregroundColor(Color("prim"))
                        .font(.system(size: 20, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .trailing)

                })
                
                Text("Competitions")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 25)
                
                if viewModel.competitions.isEmpty {
                    
                    VStack(spacing: 20) {
                        
                        Image("bike")
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .semibold))
                        
                        Text("No competitions added")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Text("+ Click to add a competition")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .regular))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                        })
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.competitions, id: \.self) { index in
                            
                                VStack(alignment: .leading, spacing: 15) {
                                    
                                    Image(index.comPhoto ?? "")
                                        .resizable()
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 170)
                                        .cornerRadius(15)
                                    
                                    VStack(alignment: .leading, spacing: 15) {
                                        
                                        Text(index.comName ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 18, weight: .medium))
                                        
                                        HStack {
                                            
                                            Image("flags")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 30)
                                            
                                            Text("\(index.comDistance ?? "") miles")
                                                .foregroundColor(Color("prim"))
                                                .font(.system(size: 16, weight: .regular))
                                        }
                                        
                                        HStack {
                                            
                                            Text("\((index.comDate ?? Date()).convertDate(format: "dd.MM.YYYY")) · \(index.comType ?? "")")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                       
                                        }
                                        
                                    }
                                    .padding()
                                }
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                            }
                        }
                    }
                }
                
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchCompetitions()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddComp(viewModel: viewModel)
        })
    }
}

#Preview {
    CompetitionsView()
}
