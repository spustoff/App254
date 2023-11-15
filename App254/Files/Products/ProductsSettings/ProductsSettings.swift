//
//  ProductsSettings.swift
//  App254
//
//  Created by Вячеслав on 11/10/23.
//

import SwiftUI

struct ProductsSettings: View {
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack(alignment: .leading, spacing: 15, content: {
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                            
                            Text("Back")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                        }
                    })
                    
                    HStack {
                        
                        Text("$\(Int.random(in: 1...255555))")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .medium))
                        
                        Text("+\(Int.random(in: 1...20))%")
                            .foregroundColor(.black)
                            .font(.system(size: 12, weight: .regular))
                            .padding(6)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                        
                        Spacer()
                    }
                })
                .padding()
                .padding(.top)
                
                TradeChart(pair: "EURUSD")
                    .disabled(true)
                
                HStack {
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Text("Apply")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.green))
                    })
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.red))
                    })
                }
                .padding([.horizontal, .bottom])
            }
        }
    }
}

#Preview {
    ProductsSettings()
}
