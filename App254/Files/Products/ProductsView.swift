//
//  ProductsView.swift
//  App254
//
//  Created by Вячеслав on 11/10/23.
//

import SwiftUI

struct ProductsView: View {
    
    @StateObject var viewModel = ProductsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack(alignment: .trailing, spacing: 10, content: {
                    
                    Button(action: {
                        
                        viewModel.isSettings = true
                        
                    }, label: {
                        
                        Image(systemName: "gear")
                            .foregroundColor(.black)
                            .font(.system(size: 23, weight: .medium))
                            .padding(.trailing, 7)
                    })
                    
                    HStack {
                        
                        Text("Products")
                            .foregroundColor(.black)
                            .font(.system(size: 25, weight: .bold))
                            .multilineTextAlignment(.leading)
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            
                            ProductsAdd(viewModel: viewModel)
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
                
                if viewModel.products.isEmpty {
                    
                    VStack(alignment: .center, spacing: 20, content: {
                        
                        Image("empty")
                        
                        VStack(alignment: .center, spacing: 5, content: {
                            
                            Text("No Products")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .semibold))
                                .multilineTextAlignment(.center)
                            
                            Text("Added products will appear here")
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
                            
                            ForEach(viewModel.products, id: \.self) { index in
                            
                                HStack {
                                    
                                    Image(systemName: "camera")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15, weight: .regular))
                                        .frame(width: 60, height: 90)
                                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                                    
                                    VStack(alignment: .leading, spacing: 7, content: {
                                        
                                        HStack(content: {
                                            
                                            Text(index.name ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 16, weight: .medium))
                                            
                                            Spacer()
                                            
                                            Text("\(index.number)")
                                                .foregroundColor(.black)
                                                .font(.system(size: 15, weight: .bold))
                                                .padding()
                                                .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                                        })
                                        
                                        Text(index.comment ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 13, weight: .regular))
                                        
                                        Text("$\(index.price)")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .semibold))
                                    })
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.15)))
                            }
                        }
                        .padding()
                    }
                }
            }
        }
        .sheet(isPresented: $viewModel.isSettings, content: {
            
            ProductsSettings()
        })
        .onAppear {
            
            viewModel.fetchProducts()
        }
    }
}

#Preview {
    ProductsView()
}
