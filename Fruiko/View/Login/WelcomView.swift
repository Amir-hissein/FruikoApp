//
//  WelcomView.swift
//  Fruiko
//
//  Created by Amir hissein on 26.08.2025.
//

import SwiftUI

struct WelcomView: View {
    var body: some View {
        ZStack{
        Image("fruiko_bg")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
           
            
            VStack {
                Text("Welcome to Fruiko")
                    .font(.customfont(.semibold, fontSize: 48))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
              
                Text("Get your groceries in a few clicks")
                    .font(.customfont(.semibold, fontSize: 16))
                    .foregroundColor(.white .opacity(0.7))
                    .multilineTextAlignment(.center)
            
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
                
                
                
                
            }.padding(.top,250)
           
        }
        
            .navigationTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .ignoresSafeArea()
                .scaledToFill()
    }
}

#Preview {
    WelcomView()
}
