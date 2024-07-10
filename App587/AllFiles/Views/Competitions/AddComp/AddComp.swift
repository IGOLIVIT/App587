//
//  AddComp.swift
//  App587
//
//  Created by IGOR on 09/07/2024.
//

import SwiftUI

struct AddComp: View {

    @StateObject var viewModel: CompetitionsViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Add a competition")
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
                            
                            viewModel.comPhoto = viewModel.currentTrack
                            viewModel.comType = viewModel.currentType
                            
                            viewModel.addCompetition()
                            
                            viewModel.currentTrack = ""
                            viewModel.comName = ""
                            viewModel.comDistance = ""
                            
                            viewModel.fetchCompetitions()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        .opacity(viewModel.currentTrack.isEmpty || viewModel.currentType.isEmpty || viewModel.comName.isEmpty || viewModel.comDistance.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.currentTrack.isEmpty || viewModel.currentType.isEmpty || viewModel.comName.isEmpty || viewModel.comDistance.isEmpty ? true : false)
                    }
                }
                .padding(.vertical)
                .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        Menu(content: {
                            
                            ForEach(viewModel.tracks, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.currentTrack = index
                                    
                                }, label: {
                                    
                                    Image(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.currentTrack.isEmpty {
                                
                                Image(systemName: "photo")
                                    .foregroundColor(.white.opacity(0.2))
                                    .font(.system(size: 60, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 170)
                                    .background(RoundedRectangle(cornerRadius: 0).fill(Color("bg3")))
                                
                            } else {
                                
                                Image(viewModel.currentTrack)
                                    .resizable()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 170)
                            }
                        })
                        .padding(.bottom)
                        
                        Text("Information")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Competition name*")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.comName.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.comName)
                                .foregroundColor(Color.white)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Distance*")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.comDistance.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.comDistance)
                                .foregroundColor(Color.white)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        
                        HStack {
                            
                            HStack {
                                
                                Image(systemName: "calendar")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 17, weight: .regular))
                                
                                DatePicker("", selection: $viewModel.comDate, displayedComponents: .date)
                                    .labelsHidden()
                            }
                            .padding(10)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                            
                            Menu(content: {
                                
                                ForEach(viewModel.racingTypes, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.currentType = index
                                        
                                    }, label: {
                                        
                                        Text(index)
                                    })
                                }
                                
                            }, label: {
                                
                                HStack {
                                    
                                    Text(viewModel.currentType)
                                        .foregroundColor(Color("prim"))
                                        .font(.system(size: 15, weight: .regular))
                                    
                                    Spacer()
                                 
                                    Image(systemName: "chevron.up.chevron.down")
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 17, weight: .regular))
                                }
                                .padding(.horizontal)
                            })
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddComp(viewModel: CompetitionsViewModel())
}
