//
//  SignInView.swift
//  Fruiko
//
//  Created by Amir hissein on 28.08.2025.
//

import SwiftUI

@available(iOS 16, *)
struct SignInView: View {
    @Binding var text: String
    @State private var isShowPicker: Bool = false
    @State private var countryObj: Country?
    
    @State private var showContent: Bool = false
    @State private var isGooglePressed: Bool = false
    @State private var isApplePressed: Bool = false
    
    var body: some View {
        ZStack {
            // Arka plan
            VStack(alignment: .leading){
                Image("sign_in_top")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: .screenWidth, height: .screenHeight)
                    .opacity(showContent ? 1 : 0)
                    .offset(y: showContent ? 0 : -100)
                    .animation(.easeOut(duration: 1), value: showContent)
            }.offset(y: -100)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20){
                    
                    // Titre
                    Text("Get your groceries with Fruiko")
                        .font(.customfont(.semibold, fontSize: 26))
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .opacity(showContent ? 1 : 0)
                        .offset(y: showContent ? 0 : 40)
                        .animation(.easeOut(duration: 0.8).delay(0.3), value: showContent)
                    
                    // Input
                    HStack {
                        if #available(iOS 17.0, *) {
                            TextFieldPhoneNumber(text: $text)
                                .opacity(showContent ? 1 : 0)
                                .offset(y: showContent ? 0 : 40)
                                .animation(.easeOut(duration: 0.8).delay(0.5), value: showContent)
                        }
                    }
                    
                    Divider()
                        .padding(.bottom, 25)
                        .opacity(showContent ? 1 : 0)
                        .animation(.easeOut(duration: 0.8).delay(0.6), value: showContent)
                    
                    // Sous-titre
                    Text("Or connect with social media")
                        .font(.customfont(.semibold, fontSize: 14))
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 25)
                        .opacity(showContent ? 1 : 0)
                        .offset(y: showContent ? 0 : 30)
                        .animation(.easeOut(duration: 0.8).delay(0.8), value: showContent)
                    
                    // Google Button
                    Button {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
                            isGooglePressed = true
                        }
                        // Simule retour
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
                                isGooglePressed = false
                            }
                        }
                        // 🔹 ici → action de login Google
                    } label: {
                        HStack {
                            Image("google")
                                .resizable()
                                .frame(width: 28, height: 28)
                            Text("Continue with Google")
                                .font(.customfont(.semibold, fontSize: 18))
                                .foregroundColor(.white)
                        }
                        .frame(maxWidth: .infinity, minHeight: 60)
                        .background(Color(hex: "5383ec"))
                        .cornerRadius(20)
                        .shadow(color: Color.blue.opacity(0.3), radius: 8, x: 0, y: 4)
                    }
                    .scaleEffect(isGooglePressed ? 0.92 : 1) // 🔹 effet press
                    .opacity(showContent ? 1 : 0)
                    .offset(y: showContent ? 0 : 50)
                    .animation(.spring(response: 0.6, dampingFraction: 0.7).delay(1), value: showContent)
                    
                    // Apple Button
                    Button {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
                            isApplePressed = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
                                isApplePressed = false
                            }
                        }
                        // 🔹 ici → action de login Apple
                    } label: {
                        HStack {
                            Image(systemName: "apple.logo")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                            Text("Continue with Apple")
                                .font(.customfont(.semibold, fontSize: 18))
                                .foregroundColor(.white)
                        }
                        .frame(maxWidth: .infinity, minHeight: 60)
                        .background(Color.black)
                        .cornerRadius(20)
                        .shadow(color: Color.black.opacity(0.3), radius: 8, x: 0, y: 4)
                    }
                    .scaleEffect(isApplePressed ? 0.92 : 1) // 🔹 effet press
                    .opacity(showContent ? 1 : 0)
                    .offset(y: showContent ? 0 : 50)
                    .animation(.spring(response: 0.6, dampingFraction: 0.7).delay(1.2), value: showContent)
                    
                }
                .padding(.horizontal, 20)
                .padding(.top, .topInsets + .screenWidth/1.3)
            }
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
        .onAppear {
            showContent = true
        }
    }
}

#Preview {
    StatefulPreviewWrapper("") { text in
        if #available(iOS 16, *) {
            SignInView(text: text)
        }
    }
}
