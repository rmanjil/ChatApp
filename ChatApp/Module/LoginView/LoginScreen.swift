//
//  LoginScreen.swift
//  ChatApp
//
//  Created by manjil on 22/02/2023.
//

import SwiftUI

struct LoginScreen: View {
    @StateObject var viewModel = LoginViewModel()
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "message.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(Color.blue)
                .padding(8)
            CustomText(title: "Email", binder: viewModel.emailTextModel, contentType: .emailAddress)
            CustomText(title: "Password", isSecure: true, binder: viewModel.passwordTextModel)
            NavigationLink(destination: EmptyView()) {
                Text("Login")
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Login")
        .navigationBarTitleDisplayMode(.inline)
        .background {
            Color.white
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
