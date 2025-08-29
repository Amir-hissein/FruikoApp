import SwiftUI

// Bouton stylisé statique pour NavigationLink
struct RoundButton: View {
    var title: String
    var backgroundColor: Color = .green
    
    var body: some View {
        Text(title)
            .font(.customfont(.semibold, fontSize: 25))
            .foregroundColor(.black)
            .frame(maxWidth: .infinity, minHeight: 60)
            .background(backgroundColor.opacity(0.9))
            .cornerRadius(12)
            .padding(.horizontal, 20)
    }
}

struct WelcomeView: View {
    var body: some View {
        ZStack {
            Image("fruiko_bg")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
         
                VStack(spacing: 20) {
                    Text("Welcome to Fruiko")
                        .font(.customfont(.semibold, fontSize: 48))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 16)
                    
                    Text("Get your groceries in a few clicks")
                        .font(.customfont(.semibold, fontSize: 16))
                        .foregroundColor(.white.opacity(0.7))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 16)
                    
                    // NavigationLink sans gesture interne
                    NavigationLink(destination: SignInView()) {
                        RoundButton(title: "Get Started", backgroundColor: .white)
                    }
                    .padding(.top, 40)
                    .buttonStyle(.plain) // optionnel mais recommandé
                }
                .padding(.horizontal, 24)
                .offset(y: 100)
            
        }
    }
}

#Preview {
    NavigationView {
        WelcomeView()
            .navigationTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
    }
}
