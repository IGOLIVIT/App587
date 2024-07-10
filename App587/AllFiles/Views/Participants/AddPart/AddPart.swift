//
//  AddPart.swift
//  App587
//
//  Created by IGOR on 09/07/2024.
//

import SwiftUI

struct AddPart: View {

    @StateObject var viewModel: ParticipantsViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Add a member")
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
                            
                            viewModel.parPhoto = viewModel.currentPhoto
                            viewModel.parCat = viewModel.currentCat
                            
                            viewModel.addParticipant()
                            
                            viewModel.currentPhoto = ""
                            viewModel.parName = ""
                            viewModel.parAge = ""
                            viewModel.parClub = ""
                            
                            viewModel.fetchParticipants()
     
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        .opacity(viewModel.currentPhoto.isEmpty || viewModel.currentCat.isEmpty || viewModel.parName.isEmpty || viewModel.parAge.isEmpty || viewModel.parClub.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.currentPhoto.isEmpty || viewModel.currentCat.isEmpty || viewModel.parName.isEmpty || viewModel.parAge.isEmpty || viewModel.parClub.isEmpty ? true : false)
                    }
                }
                .padding(.vertical)
                .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        Menu(content: {
                            
                            ForEach(viewModel.photos, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.currentPhoto = index
                                    
                                }, label: {
                                    
                                    Image(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.currentPhoto.isEmpty {
                                
                                Image(systemName: "person.fill")
                                    .foregroundColor(.white.opacity(0.2))
                                    .font(.system(size: 50, weight: .regular))
                                    .frame(width: 100, height: 100)
                                    .background(Circle().fill(Color("bg")))
                                
                            } else {
                                
                                Image(viewModel.currentPhoto)
                                    .resizable()
                                    .frame(width: 100, height: 100)
                        
                            }
                        })
                        .padding(.bottom)
                        
                        Text("Information")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Name")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.parName.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.parName)
                                .foregroundColor(Color.white)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Age")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.parAge.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.parAge)
                                .foregroundColor(Color.white)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                        
                        HStack {
                            
                            Image("bike")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20)
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Sport club")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.parClub.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.parClub)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                        .padding(.bottom)
                        
                        Text("Category")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            
                            ForEach(viewModel.categories, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.currentCat = index
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        ZStack {
                                            
                                            Circle()
                                                .stroke(Color.gray)
                                                .frame(width: 16)
                                            
                                            Circle()
                                                .fill(Color("prim"))
                                                .frame(width: 16)
                                                .opacity(viewModel.currentCat == index ? 1 : 0)
                                            
                                            Circle()
                                                .stroke(Color("prim"))
                                                .frame(width: 22)
                                                .opacity(viewModel.currentCat == index ? 1 : 0)

                                        }
                                        
                                        Text(index)
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .regular))
                                        
                                        Spacer()
                                        
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color.white.opacity(0.4)))
                                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim").opacity(viewModel.currentCat == index ? 1 : 0)))
                                    .padding(1)

                                })
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddPart(viewModel: ParticipantsViewModel())
}
