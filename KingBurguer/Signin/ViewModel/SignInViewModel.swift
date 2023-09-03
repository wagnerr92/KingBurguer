//
//  SignInViewModel.swift
//  KingBurguer
//
//  Created by Wagner Rodrigues on 21/08/23.
//

import Foundation

protocol SignInViewModelDelegate{
    func viewModelDidChanged(state: SignInState)
}

class SignInViewModel{
    
    var delegate: SignInViewModelDelegate?
    var coordinator: SignInCoordinator?
    
    var state: SignInState = .none {
        didSet {
            delegate?.viewModelDidChanged(state: state)
        }
    }
    
    func send(){
        state = .loading
        
        //aqui esperamos 2 segundos(latencia de rede)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            self.state = .error("Usuário não existe")
        }
    }
    
    func goToSignUp(){
        coordinator?.signUp()
        
    }
}


