//
//  ReportsAdd.swift
//  App254
//
//  Created by Вячеслав on 11/10/23.
//

import SwiftUI

struct ReportsAdd: View {
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel = ProductsViewModel()
    @StateObject var reportModel = ReportsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("New Report")
                    .foregroundColor(.black)
                    .font(.system(size: 24, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .multilineTextAlignment(.leading)
                
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
                            
                                HStack(spacing: 10, content: {
                                    
                                    Circle()
                                        .stroke(.gray.opacity(0.5), lineWidth: 2)
                                        .frame(width: 25, height: 25)
                                        .overlay (
                                        
                                            ZStack {
                                                
                                                Circle()
                                                    .fill(Color("primary"))
                                                    .frame(width: 25, height: 25)
                                                
                                                Image(systemName: "checkmark")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 12, weight: .bold))
                                            }
                                                .opacity(viewModel.selectedForReport == index ? 1 : 0)
                                        )
                                    
                                    Button(action: {
                                        
                                        viewModel.selectedForReport = index
                                        
                                    }, label: {
                                        
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
                                    })
                                })
                            }
                        }
                        .padding()
                    }
                }
                
                Spacer()
                
                Button(action: {
                    
                    guard let selected = viewModel.selectedForReport else { return }
                    
                    reportModel.reports.append(selected.name ?? "")
                    
                    router.wrappedValue.dismiss()
                    
                    viewModel.selectedForReport = nil
                    
                }, label: {
                    
                    Text("New Report")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                        .padding()
                })
                .opacity(viewModel.selectedForReport == nil ? 0.5 : 1)
                .disabled(viewModel.selectedForReport == nil ? true : false)
            }
        }
        .onAppear {
            
            viewModel.fetchProducts()
        }
    }
}

#Preview {
    ReportsAdd()
}
