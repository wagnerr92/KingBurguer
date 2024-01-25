//
//  SignUpViewController.swift
//  KingBurguer
//
//  Created by Wagner Rodrigues on 22/08/23.
//

import Foundation
import UIKit

class SignUpViewController: UIViewController {
    
    let name: UITextField = {
        let name = UITextField()
        name.backgroundColor = .green
        name.placeholder = "Entre com o seu nome"
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    let email: UITextField = {
        let mail = UITextField()
        mail.backgroundColor = .green
        mail.placeholder = "Entre com o seu e-mail"
        mail.translatesAutoresizingMaskIntoConstraints = false
        return mail
    }()
    
    let password: UITextField = {
        let password = UITextField()
        password.backgroundColor = .green
        password.placeholder = "Entre com a sua senha"
        password.translatesAutoresizingMaskIntoConstraints = false
        return password
    }()
    
    let document: UITextField = {
        let document = UITextField()
        document.backgroundColor = .green
        document.placeholder = "Entre com o seu CPF"
        document.translatesAutoresizingMaskIntoConstraints = false
        return document
    }()
    
    let birthday: UITextField = {
        let birthday = UITextField()
        birthday.backgroundColor = .green
        birthday.placeholder = "Entre com a sua data de nascimento"
        birthday.translatesAutoresizingMaskIntoConstraints = false
        return birthday
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
    
    var viewModel: SignUpViewModel? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(name)
        view.addSubview(email)
        view.addSubview(password)
        view.addSubview(document)
        view.addSubview(birthday)
        view.addSubview(send)
        
        let nameConstraints = [
            name.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            name.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            name.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            name.heightAnchor.constraint(equalToConstant: 50.0)
        ]
        
        let emailConstraints = [
            email.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            email.trailingAnchor.constraint(equalTo: name.trailingAnchor),
            email.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10.0),
            email.heightAnchor.constraint(equalToConstant: 50.0)
        ]
        
        let passwordConstraints = [
            password.leadingAnchor.constraint(equalTo: email.leadingAnchor),
            password.trailingAnchor.constraint(equalTo: email.trailingAnchor),
            password.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 10.0),
            password.heightAnchor.constraint(equalToConstant: 50.0)
        ]
        
        let documentConstraints = [
            document.leadingAnchor.constraint(equalTo: password.leadingAnchor),
            document.trailingAnchor.constraint(equalTo: password.trailingAnchor),
            document.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 10.0),
            document.heightAnchor.constraint(equalToConstant: 50.0)
        ]
        
        let birthdayConstraints = [
            birthday.leadingAnchor.constraint(equalTo: document.leadingAnchor),
            birthday.trailingAnchor.constraint(equalTo: document.trailingAnchor),
            birthday.topAnchor.constraint(equalTo: document.bottomAnchor, constant: 10.0),
            birthday.heightAnchor.constraint(equalToConstant: 50.0)
        ]
        
        let sendConstraints = [
            send.leadingAnchor.constraint(equalTo: birthday.leadingAnchor),
            send.trailingAnchor.constraint(equalTo: birthday.trailingAnchor),
            send.topAnchor.constraint(equalTo: birthday.bottomAnchor, constant: 10.0),
            send.heightAnchor.constraint(equalToConstant: 50.0)
        ]
        
        NSLayoutConstraint.activate(nameConstraints)
        NSLayoutConstraint.activate(emailConstraints)
        NSLayoutConstraint.activate(passwordConstraints)
        NSLayoutConstraint.activate(documentConstraints)
        NSLayoutConstraint.activate(birthdayConstraints)
        NSLayoutConstraint.activate(sendConstraints)
    }
    
    @objc func sendDidTap(_ sender: UIButton){
        viewModel?.send()
    }
}

extension SignUpViewController: SignUpViewModelDelegate{
    func viewModelDidChanged(state: SignUpState) {
        switch(state){
        case .none:
            break
        case .loading:
            //mostrar a barra progress
            break
        case .goToHome:
            //navegar para a tela home
            break
        case .error(let msg):
            let alert = UIAlertController(title: "Título", message: msg, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            
            self.present(alert, animated: true)
            
            break
        }
    }
}
