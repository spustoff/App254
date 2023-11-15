//
//  ProductsAdd.swift
//  App254
//
//  Created by Вячеслав on 11/10/23.
//

import SwiftUI

struct ProductsAdd: View {
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel: ProductsViewModel
    
    var body: some View {
       
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("New Product")
                    .foregroundColor(.black)
                    .font(.system(size: 24, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .multilineTextAlignment(.leading)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(spacing: 25) {
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Product Name")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.name.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.name)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Comment")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.comment.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.comment)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Number")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.number.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.number)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                                .keyboardType(.decimalPad)
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("$")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.price.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.price)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Pieces")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.pieces.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.pieces)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                    }
                    .padding()
                }
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.addProduct(completion: {
                        
                        viewModel.fetchProducts()
                        
                        router.wrappedValue.dismiss()
                        
                        viewModel.name = ""
                        viewModel.comment = ""
                        viewModel.number = ""
                        viewModel.price = ""
                        viewModel.pieces = ""
                    })
                    
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                        .padding()
                })
                .opacity(viewModel.name.isEmpty || viewModel.comment.isEmpty || viewModel.number.isEmpty || viewModel.price.isEmpty || viewModel.pieces.isEmpty ? 0.5 : 1)
                .disabled(viewModel.name.isEmpty || viewModel.comment.isEmpty || viewModel.number.isEmpty || viewModel.price.isEmpty || viewModel.pieces.isEmpty ? true : false)
            }
        }
    }
}

#Preview {
    ProductsAdd(viewModel: ProductsViewModel())
}
