//
//  LoginScreen.swift
//  ChatApp
//
//  Created by manjil on 22/02/2023.
//

import SwiftUI

struct LoginScreen: View {
    @StateObject var viewModel = LoginViewModel()
    @State var isAlert = false
    @State var message = ""
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "message.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(Color.blue)
                .padding(8)
            CustomText(title: "Email", binder: viewModel.emailTextModel, contentType: .emailAddress)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
            CustomText(title: "Password", isSecure: true, binder: viewModel.passwordTextModel)
                .autocapitalization(.none)
            
            Button(action: loginAction, label: {
                Text("LOG IN")
                    .frame(maxWidth: .infinity, minHeight: 40)
                    .foregroundColor(Color.white)
                    .background {
                        Color.blue
                    }
                    .cornerRadius(5)
            })
            Spacer()
        }
        .padding()
        .navigationTitle("Login")
        .navigationBarTitleDisplayMode(.inline)
        .background {
            Color.white
        }
        .alert(isPresented: $isAlert) {
            Alert(title: Text("pkt fuel"), message: Text(message))
        }
    }
    
    private func loginAction() {
        if let error = viewModel.error.first as? AppError {
            message = error.localizedDescription
            isAlert = true
            return
        }
        viewModel.login { error in
            if let  error = error {
                isAlert = true
                message = error.localizedDescription
            }
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
