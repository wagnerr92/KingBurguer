//
//  HomeCoordinator.swift
//  KingBurguer
//
//  Created by Wagner Rodrigues on 18/11/23.
//

import Foundation
import UIKit

class HomeCoordinator{
    
    private let navigationController: UINavigationController
    
    private let window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
        self.navigationController = UINavigationController()
    }
    
    func start(){
        let homeVC = HomeViewController()
        navigationController.pushViewController(homeVC, animated: true)
        
        //aqui acontece a troca de navigationController
        window?.rootViewController = navigationController
        
    }
    
}
