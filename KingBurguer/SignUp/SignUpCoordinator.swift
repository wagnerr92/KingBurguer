//
//  SignUpCoordinator.swift
//  KingBurguer
//
//  Created by Wagner Rodrigues on 30/08/23.
//

import Foundation
import UIKit

class SignUpCoordinator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start(){
        let signUpVC = SignUpViewController()
        //tera um viewmodel
        
        navigationController.pushViewController(signUpVC, animated: true)
    }
}
