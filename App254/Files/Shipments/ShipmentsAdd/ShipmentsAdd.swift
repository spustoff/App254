//
//  ShipmentsAdd.swift
//  App254
//
//  Created by Вячеслав on 11/10/23.
//

import SwiftUI

struct ShipmentsAdd: View {
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel: ShipmentsViewModel
    
    var body: some View {
       
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("New Shipment")
                    .foregroundColor(.black)
                    .font(.system(size: 24, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .multilineTextAlignment(.leading)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(spacing: 25) {
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Title")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.title.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.title)
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
                                .keyboardType(.decimalPad)
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                        
                        HStack {
                            
                            Text("Date")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            Spacer()
                            
                            DatePicker(selection: $viewModel.date, displayedComponents: .date, label: {})
                                .labelsHidden()
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                    }
                    .padding()
                }
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.addShipment(completion: {
                        
                        viewModel.fetchShipments()
                        
                        router.wrappedValue.dismiss()
                        
                        viewModel.title = ""
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
                .opacity(viewModel.title.isEmpty || viewModel.pieces.isEmpty ? 0.5 : 1)
                .disabled(viewModel.title.isEmpty || viewModel.pieces.isEmpty ? true : false)
            }
        }
    }
}

#Preview {
    ShipmentsAdd(viewModel: ShipmentsViewModel())
}
