//
//  ShipmentsView.swift
//  App254
//
//  Created by Вячеслав on 11/10/23.
//

import SwiftUI

struct ShipmentsView: View {
    
    @StateObject var viewModel = ShipmentsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack(alignment: .trailing, spacing: 10, content: {
                    
                    NavigationLink(destination: {
                        
                        ShipmentsCalendar()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Image(systemName: "calendar")
                            .foregroundColor(.black)
                            .font(.system(size: 23, weight: .medium))
                            .padding(.trailing, 7)
                    })
                    
                    HStack {
                        
                        Text("Shipments")
                            .foregroundColor(.black)
                            .font(.system(size: 25, weight: .bold))
                            .multilineTextAlignment(.leading)
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            
                            ShipmentsAdd(viewModel: viewModel)
//                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            HStack(spacing: 10) {
                                
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Text("New")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .medium))
                            }
                            .padding()
                            .background(Capsule().fill(Color("primary")))
                        })
                    }
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                
                if viewModel.shipments.isEmpty {
                    
                    VStack(alignment: .center, spacing: 20, content: {
                        
                        Image("empty")
                        
                        VStack(alignment: .center, spacing: 5, content: {
                            
                            Text("No Shipments")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .semibold))
                                .multilineTextAlignment(.center)
                            
                            Text("Added shipments will appear here")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .multilineTextAlignment(.center)
                        })
                    })
                    .padding()
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.shipments, id: \.self) { index in
                            
                                VStack(alignment: .leading, spacing: 10, content: {
                                    
                                    Text((index.date ?? Date()).convertDate(format: "MMM d"))
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                        .multilineTextAlignment(.leading)
                                    
                                    HStack {
                                        
                                        Text(index.title ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .medium))
                                            .multilineTextAlignment(.leading)
                                        
                                        Spacer()
                                        
                                        Text("\(index.pieces ?? "")")
                                            .foregroundColor(.black)
                                            .font(.system(size: 13, weight: .bold))
                                            .padding(7)
                                            .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                                    }
                                })
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.15)))
                            }
                        }
                        .padding()
                    }
                }
            }
        }
//        .sheet(isPresented: $viewModel.isSettings, content: {
//            
//            ProductsSettings()
//        })
        .onAppear {
            
            viewModel.fetchShipments()
        }
    }
}

#Preview {
    ShipmentsView()
}
