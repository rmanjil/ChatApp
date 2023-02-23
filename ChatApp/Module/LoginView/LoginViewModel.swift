//
//  LoginViewModel.swift
//  ChatApp
//
//  Created by manjil on 22/02/2023.
//

import SwiftUI
import Combine

class BaseViewModel {
    var bag = Set<AnyCancellable>()
    init() {
        print("Initialized --> \(String(describing: self))")
    }
    
    deinit {
        debugPrint("De-Initialized --> \(String(describing: self))")
    }
}
class LoginViewModel: BaseViewModel, ObservableObject {
    @AppStorage(CacheKey.isLogin.rawValue) private var isLogin = false
    
    let emailTextModel = TextModel(dataType: .email, interactor: TextInteractor(type: PlainFieldType.email, pattern: Pattern.email))
    let passwordTextModel = TextModel(dataType: .password, interactor: TextInteractor(type: PlainFieldType.password, pattern: Pattern.none))
    
    @Published var isSuccess = false
    
    var error = [Error]()
    let authManager = AuthManager()
    
    override init() {
        super.init()
        observeValidation()
    }
    
    /// Method to observe the validations of the TextFields
    private func observeValidation() {
        Publishers.CombineLatest(emailTextModel.$error, passwordTextModel.$error).map {
            email, password -> [Error] in
            return [email, password].compactMap { $0 }
        }.eraseToAnyPublisher().sink { [weak self] result in
            self?.error = result
        }.store(in: &bag)
    }
    
    func login(completion: @escaping ((_ error: Error?) -> Void)) {
        authManager.login(email: emailTextModel.value.trim, password: passwordTextModel.value.trim) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success:
                self.isLogin = true
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
}
