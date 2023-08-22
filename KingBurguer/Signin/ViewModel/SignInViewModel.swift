//
//  SignInViewModel.swift
//  KingBurguer
//
//  Created by Wagner Rodrigues on 21/08/23.
//

import Foundation

protocol SignInViewModelDelegate{
    func viewModelDidChanged(viewModel: SignInViewModel)
}

class SignInViewModel{
    
    var delegate: SignInViewModelDelegate?
    
    var state: Bool = false {
        didSet {
            delegate?.viewModelDidChanged(viewModel: self)
        }
    }
    
    func send(){
        state = true
    }
}
