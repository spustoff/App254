//
//  SearchView.swift
//  App254
//
//  Created by Вячеслав on 11/10/23.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var viewModel = ProductsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Search by name...")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.search_field.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.search_field)
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                    })
                    
                    Spacer()
                    
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .font(.system(size: 13, weight: .regular))
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                .padding([.horizontal, .top])
                
                if viewModel.getFilteredProducts().isEmpty {
                    
                    VStack(alignment: .center, spacing: 20, content: {
                        
                        Image("empty")
                        
                        VStack(alignment: .center, spacing: 5, content: {
                            
                            Text("No Result")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .semibold))
                                .multilineTextAlignment(.center)
                            
                            Text("There are no such products, try another one by name")
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
                            
                            ForEach(viewModel.getFilteredProducts(), id: \.self) { index in
                            
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
        .onAppear {
            
            viewModel.fetchProducts()
        }
    }
}

#Preview {
    SearchView()
}
