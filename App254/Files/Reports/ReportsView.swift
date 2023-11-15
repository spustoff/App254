//
//  ReportsView.swift
//  App254
//
//  Created by Вячеслав on 11/10/23.
//

import SwiftUI

struct ReportsView: View {
    
    @StateObject var viewModel = ReportsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Reports")
                    .foregroundColor(.black)
                    .font(.system(size: 25, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                if viewModel.reports.isEmpty {
                    
                    VStack(alignment: .center, spacing: 5, content: {
                        
                        Text("No Reports")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text("Added reports will appear here")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .padding()
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                            
                            ForEach(viewModel.reports, id: \.self) { index in
                                
                                VStack(alignment: .leading, spacing: 10, content: {
                                    
                                    Text(Date().convertDate(format: "MMM d"))
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                        .multilineTextAlignment(.leading)
                                    
                                    Text(index)
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .medium))
                                        .multilineTextAlignment(.leading)
                                })
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                            }
                        })
                        .padding()
                    }
                }
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    ReportsAdd()
                    
                }, label: {
                    
                    Text("New Report")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                        .padding()
                })
            }
        }
    }
}

#Preview {
    ReportsView()
}
