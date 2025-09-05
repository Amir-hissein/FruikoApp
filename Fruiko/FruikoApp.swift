//
//  FruikoApp.swift
//  Fruiko
//
//  Created by Amir hissein on 26.08.2025.
//

import SwiftUI

@available(iOS 17.0, *)
@main
struct FruikoApp: App {
    var body: some Scene {
        WindowGroup {
         NavigationView {
                 WelcomeView()
                     .navigationTitle("")
                     .navigationBarBackButtonHidden(true)
                     .navigationBarHidden(true)
             }
            }
        }
    }

