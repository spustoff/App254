//
//  ShipmentsCalendar.swift
//  App254
//
//  Created by Вячеслав on 11/10/23.
//

import SwiftUI

struct ShipmentsCalendar: View {
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
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
                    
                    Spacer()
                }
                .padding()
                
                DatePicker(selection: .constant(Date()), displayedComponents: .date, label: {})
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding()
                
                Spacer()
            }
        }
    }
}

#Preview {
    ShipmentsCalendar()
}
