//
//  LoginViewModel.swift
//  ChatApp
//
//  Created by manjil on 22/02/2023.
//

import Foundation
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
    let emailTextModel = TextModel(dataType: .email, interactor: TextInteractor(type: PlainFieldType.email, pattern: Pattern.email))
    let passwordTextModel = TextModel(dataType: .password, interactor: TextInteractor(type: PlainFieldType.password, pattern: Pattern.none))
    
    @Published var isSuccess = false
   // let userManager: UserManager
    
    var  error = [Error]()
    override init() {
       // userManager = UserManager()
        super.init()
       
        observeValidation()
      //  observeEvent()
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
    
    
//    private func observeEvent() {
//        userManager.result.receive(on: RunLoop.main).sink { [weak self] (result) in
//            guard let self = self else { return }
//            self.isSuccess = result.success
//        }.store(in: &bag)
//    }
//
//    func login() {
//        let parameter = ["email": emailTextModel.value.trim, "password": passwordTextModel.value.trim]
//        userManager.request(router: UserRouter.login(parameter))
//    }
}
