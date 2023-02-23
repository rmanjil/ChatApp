//
//  ContentView.swift
//  ChatApp
//
//  Created by manjil on 22/02/2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage(CacheKey.isLogin.rawValue) private var isLogin = false
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Button("LOG OUT") {
                isLogin = false
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
