//
//  RoundButton.swift
//  Fruiko
//
//  Created by Amir hissein on 26.08.2025.
//

import SwiftUI

struct RoundButton: View {
    var body: some View {
        Button{
            
        }label: {
            Text("get started")
                .font(.customfont(.semibold, fontSize: 25))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
              
             
               
                
        }  .frame(minWidth: 0, maxWidth: .screenWidth/10*9, minHeight: 60,maxHeight: 60)
        .background(.ultraThinMaterial)
            .opacity(0.7)
            .cornerRadius(10)
            .offset(y:30)
    }
}

#Preview {
    RoundButton()
}
