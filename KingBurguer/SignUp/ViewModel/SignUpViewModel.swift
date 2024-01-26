//
//  SignUpViewModel.swift
//  KingBurguer
//
//  Created by Wagner Rodrigues on 14/11/23.
//

import Foundation

protocol SignUpViewModelDelegate{
    func viewModelDidChanged(state: SignUpState)
}

class SignUpViewModel{
    
    var delegate: SignUpViewModelDelegate?
    var coordinator: SignUpCoordinator?
    
    var state: SignUpState = .none {
        didSet {
            delegate?.viewModelDidChanged(state: state)
        }
    }
    
    func send(){
        state = .loading
        
        //aqui esperamos 2 segundos(latencia de rede)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            self.state = .goToHome
        }
    }
    
    func goToHome(){
        coordinator?.home()
    }
}


