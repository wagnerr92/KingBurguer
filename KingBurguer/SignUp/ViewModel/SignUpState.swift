//
//  SignUpState.swift
//  KingBurguer
//
//  Created by Wagner Rodrigues on 14/11/23.
//

import Foundation

enum SignUpState{
    case none
    case loading
    case goToHome
    case error(String)
}
