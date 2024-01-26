//
//  SignInCoordinator.swift
//  KingBurguer
//
//  Created by Wagner Rodrigues on 22/08/23.
//

import Foundation
import UIKit

class SignInCoordinator{
    
    private let window: UIWindow?
    private let navigationController: UINavigationController
    
    init(window: UIWindow?){
        self.window = window
        self.navigationController = UINavigationController()
    }
    
    func start(){
        let viewModel = SignInViewModel()
        viewModel.coordinator = self
        
        let signInVC = SignInViewController()
        signInVC.viewModel = viewModel
        
        //rootViewController
        navigationController.pushViewController(signInVC, animated: true)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
    }
    
    func signUp(){
        let signUpCoordinator = SignUpCoordinator(navigationController: navigationController)
        signUpCoordinator.parentCoordinator = self
        signUpCoordinator.start()
    }
    
    func home(){
        let homeCoordinator = HomeCoordinator(window: window)
        homeCoordinator.start()
    }
}
