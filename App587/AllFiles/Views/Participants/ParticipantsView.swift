//
//  ParticipantsView.swift
//  App587
//
//  Created by IGOR on 09/07/2024.
//

import SwiftUI

struct ParticipantsView: View {
    
    @StateObject var viewModel = ParticipantsViewModel()
    
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
                
                Text("Participants")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 25)
                
                if viewModel.participants.isEmpty {
                    
                    VStack(spacing: 20) {
                        
                        Image("leoples")
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .semibold))
                        
                        Text("No members added")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Text("+ Click to add a member")
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
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                            
                            ForEach(viewModel.participants, id: \.self) { index in
                                
                                VStack(spacing: 12) {
                                    
                                    Image(index.parPhoto ?? "")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 70)
                                    
                                    Text(index.parName ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .medium))
                                    
                                    Text(index.parClub ?? "")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15, weight: .regular))
                                        .padding(.bottom)
                                    
                                    Text(index.parCat ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 13, weight: .regular))
                                        .padding(4)
                                        .padding(.horizontal, 5)
                                        .background(RoundedRectangle(cornerRadius: 5).fill(index.parCat == "Gregory" ? Color("prim") : Color.green))
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                            }
                        })
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchParticipants()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddPart(viewModel: viewModel)
        })
    }
}

#Preview {
    ParticipantsView()
}
