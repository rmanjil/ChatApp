//
//  ChatAppApp.swift
//  ChatApp
//
//  Created by manjil on 22/02/2023.
//

import SwiftUI
import Firebase

@main
struct ChatAppApp: App {
    @AppStorage(CacheKey.isLogin.rawValue) private var isLogin = false
    var body: some Scene {
        WindowGroup {
            NavigationView {
                
                if isLogin {
                    ContentView()
                } else {
                    LoginScreen()
                }
            }.onAppear {
                FirebaseApp.configure()
            }
        }
    }
}
