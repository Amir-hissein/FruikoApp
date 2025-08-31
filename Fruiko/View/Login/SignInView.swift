//
//  SignInView.swift
//  Fruiko
//
//  Created by Amir hissein on 28.08.2025.
//

import SwiftUI

struct SignInView: View {
    @State var textMobile: String = ""
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                Image("sign_in_top")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: .screenWidth,height: .screenHeight)
                
             
            }.offset(y:-100)
     
            ScrollView(){
            
                VStack(alignment: .leading){
                    Text("Get your grocieries with Fruiko")
                        .font(.customfont(.semibold, fontSize: 26))
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.center)
                    HStack{
                        Button{
                            
                        }label: {
                            Image("")
                            Text("+1")
                                .font(.customfont(.medium, fontSize: 18))
                                .foregroundColor(.primaryText)
                                }
                        TextField("Enter Mobil", text: $textMobile)
                            .frame(minWidth :0,maxWidth: .infinity)
                      
                        
                  
                    }
                    Divider()
                        .padding(.bottom,25)
                    
                    Text("Or connect with social media")
                        .font(.customfont(.semibold, fontSize: 14))
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                        .frame(minWidth :0,maxWidth: .infinity,alignment: .center)
                  
                        .padding(.bottom,25)
                    
                    
                    Button{
                        
                    }label:{
                        HStack {
                            Image("google")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.white)
                                .padding()
                                
                            Text("Continue with Google")
                                .font(.customfont(.semibold, fontSize: 18))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                        }
                                  
                    }.frame(minWidth: 0,maxWidth: .infinity,minHeight: 60,maxHeight: 60)
                        .background(Color(hex: "5383ec"))
                        .cornerRadius(20)
                    
                    
                    Button{
                        
                    }label:{
                        HStack {
                            Image(systemName: "apple.logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.white)
                                .padding()
                                
                                .multilineTextAlignment(.leading)
                            Text("Continue with Apple ")
                                .font(.customfont(.semibold, fontSize: 18))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                        }
                                  
                    }.frame(minWidth: 0,maxWidth: .infinity,minHeight: 60,maxHeight: 60)
                        .background(.primary)
                        .cornerRadius(20)
                    
                }.padding(.horizontal,20)
                .frame(width: .screenWidth,alignment: .leading)
                .padding(.top,.topInsets + .screenWidth)
                
                
             
            }
        }.navigationTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .ignoresSafeArea()
    }
}

#Preview {
    SignInView()
}
