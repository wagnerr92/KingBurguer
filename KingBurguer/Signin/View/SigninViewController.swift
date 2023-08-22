//
//  SigninViewController.swift
//  KingBurguer
//
//  Created by Wagner Rodrigues on 19/08/23.
//

import Foundation
import UIKit

class SignInViewController: UIViewController, SignInViewModelDelegate {
    
    let email: UITextField = {
        let ed = UITextField()
        ed.backgroundColor = .blue
        ed.placeholder = "Entre com o seu e-mail"
        ed.translatesAutoresizingMaskIntoConstraints = false
        return ed
    }()
    
    let password: UITextField = {
        let ed = UITextField()
        ed.backgroundColor = .red
        ed.placeholder = "Entre com a sua senha"
        ed.translatesAutoresizingMaskIntoConstraints = false
        return ed
    }()
    
    lazy var send: UIButton = {
        let btn = UIButton()
        btn.setTitle("Entrar", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .yellow
        btn.translatesAutoresizingMaskIntoConstraints = false
        //1-classe, 2-function, 3-evento
        btn.addTarget(self, action: #selector(sendDidTap), for: .touchUpInside)
        return btn
    }()
    
    var viewModel: SignInViewModel? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        
        view.addSubview(email)
        view.addSubview(password)
        view.addSubview(send)
        
        let emailConstraints = [
            //1 - coordenadas a esquerda
            email.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            //2 - coordenadas da direita
            email.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            //3 - coordenadas do centro
            email.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            //4 - coordenadas (tamanho fixo) height = altura
            email.heightAnchor.constraint(equalToConstant: 50.0)
        ]
        
        let passwordConstraints = [
            password.leadingAnchor.constraint(equalTo: email.leadingAnchor),
            password.trailingAnchor.constraint(equalTo: email.trailingAnchor),
            password.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 10.0),
            password.heightAnchor.constraint(equalToConstant: 50.0)
        ]
        
        let sendConstraints = [
            send.leadingAnchor.constraint(equalTo: password.leadingAnchor),
            send.trailingAnchor.constraint(equalTo: password.trailingAnchor),
            send.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 10.0),
            send.heightAnchor.constraint(equalToConstant: 50.0)
        ]
        
        NSLayoutConstraint.activate(emailConstraints)
        NSLayoutConstraint.activate(passwordConstraints)
        NSLayoutConstraint.activate(sendConstraints)
       
    }
    
    @objc func sendDidTap(_ sender: UIButton){
        viewModel?.send()
    }
    
    func viewModelDidChanged(viewModel: SignInViewModel) {
        print("O viewModel notificou a ViewController")
    }
    
}
