//
//  SignInState.swift
//  KingBurguer
//
//  Created by Wagner Rodrigues on 21/08/23.
//

import Foundation

enum SignInState{
    case none
    case loading
    case goToHome
    case error(String)
}
