//
//  LoginViewController.swift
//  Navigation
//
//  Created by Елена Земляк on 21.05.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let nc = NotificationCenter.default
    
    lazy var loginScreen: UIView = {
        let loginScreen = UIView()
        loginScreen.backgroundColor = .white
        loginScreen.translatesAutoresizingMaskIntoConstraints = false
        return loginScreen
    }()
    
    lazy var passwordLabel: UILabel = {
        let passwordLabel = UILabel()
        passwordLabel.textColor = .gray
        passwordLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        passwordLabel.textAlignment = .left
        passwordLabel.text = "Слишком короткий пароль"
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.alpha = 0
        return passwordLabel
    }()
    
    lazy var logoImageView: UIImageView = {
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "logo")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        return logoImageView
    }()
    
    lazy var loginPasswordStackView: UIStackView = {
        let stack = UIStackView ()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.layer.borderWidth = 0.5
        stack.layer.borderColor = UIColor.lightGray.cgColor
        stack.layer.cornerRadius = 10
        stack.clipsToBounds = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var loginTextField: UITextField = {
    let loginTextField = UITextField ()
        loginTextField.font = UIFont .systemFont(ofSize: 16, weight: .regular)
        loginTextField.textColor = .black
        loginTextField.autocapitalizationType = .none
        loginTextField.placeholder = " Email or phone number"
        loginTextField.layer.borderColor = UIColor.lightGray.cgColor
        loginTextField.backgroundColor = .systemGray6
        loginTextField.layer.borderWidth = 0.5
        loginTextField.leftView = UIView(frame: CGRect(x: 0, y: 10, width: 10, height: loginTextField.frame.height))
        loginTextField.leftViewMode = .always
        loginTextField.delegate = self
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        return loginTextField
    }()
    
    lazy var passwordTextField: UITextField = {
    let passwordTextField = UITextField ()
        passwordTextField.font = UIFont .systemFont(ofSize: 16, weight: .regular)
        passwordTextField.textColor = .black
        passwordTextField.autocapitalizationType = .none
        passwordTextField.placeholder = " Password"
        passwordTextField.backgroundColor = .systemGray6
        passwordTextField.isSecureTextEntry = true
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 10, width: 10, height: passwordTextField.frame.height))
        passwordTextField.leftViewMode = .always
        passwordTextField.delegate = self
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        return passwordTextField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Log In", for: .normal)
        button.setBackgroundImage(UIImage(named: "blue_pixel")!.alpha(1), for: .normal)
        button.setBackgroundImage(UIImage(named: "blue_pixel")!.alpha(0.8), for: .selected)
        button.setBackgroundImage(UIImage(named: "blue_pixel")!.alpha(0.8), for: .highlighted)
        button.setBackgroundImage(UIImage(named: "blue_pixel")!.alpha(0.8), for: .disabled)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func tapAction() {
        
        let standartLogin = "Login"
        let standartPassword = "Password"
        guard let enteredLogin = loginTextField.text else {return}
        guard let enteredPassword = passwordTextField.text else {return}
        
        
        if enteredLogin.isEmpty && enteredPassword.isEmpty{
            
            UIView.animate(withDuration: 1)
            {
                self.loginTextField.layer.borderColor = UIColor.red.cgColor
                self.loginTextField.layer.borderWidth = 3
                self.loginTextField.layer.cornerRadius = 10
                self.passwordTextField.layer.borderColor = UIColor.red.cgColor
                self.passwordTextField.layer.borderWidth = 3
                self.passwordTextField.layer.cornerRadius = 10
             }
            completion: { _ in
                UIView.animate(withDuration: 0.1)
                    {
                        self.loginTextField.layer.borderColor = UIColor.lightGray.cgColor
                        self.loginTextField.layer.borderWidth = 0.5
                        self.loginTextField.layer.cornerRadius = 0
                        self.passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
                        self.passwordTextField.layer.borderWidth = 0.5
                        self.passwordTextField.layer.cornerRadius = 0
                    }
            }
            return
        }
                
        if enteredLogin.isEmpty  {
            UIView.animate(withDuration: 1)
            {
                self.loginTextField.layer.borderColor = UIColor.red.cgColor
                self.loginTextField.layer.borderWidth = 3
                self.loginTextField.layer.cornerRadius = 10
             }
            completion: { _ in
                UIView.animate(withDuration: 0.1)
                    {
                        self.loginTextField.layer.borderColor = UIColor.lightGray.cgColor
                        self.loginTextField.layer.borderWidth = 0.5
                        self.loginTextField.layer.cornerRadius = 0
                    }
            }
            return
        }
        
        if enteredPassword.isEmpty {
            
            UIView.animate(withDuration: 1)
            {
                self.passwordTextField.layer.borderColor = UIColor.red.cgColor
                self.passwordTextField.layer.borderWidth = 3
                self.passwordTextField.layer.cornerRadius = 10
             }
            completion: { _ in
                UIView.animate(withDuration: 0.1)
                    {
                     
                        self.passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
                        self.passwordTextField.layer.borderWidth = 0.5
                        self.passwordTextField.layer.cornerRadius = 0
                    }
            }
            return
        }
        
        if enteredPassword.count < 8 {
            passwordLabel.alpha = 1
            return
        }else{
            passwordLabel.alpha = 0
        }
        
        if enteredPassword != standartPassword || enteredLogin != standartLogin {
            let alert = UIAlertController(title: "Предупреждениe", message: "введен не верный логин/пароль", preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .destructive)
            alert.addAction(action)
            present(alert, animated: true)
        }
       
        let profileVC = ProfileViewController ()
        navigationController?.pushViewController(profileVC, animated: true)
        profileVC.navigationItem.title = "Profile"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        configureSubviews()
        makeElements()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nc.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(kbdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func kbdShow(notification: NSNotification) {
        if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = kbdSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbdSize.height, right: 0)
        }
    }
    
    @objc private func kbdHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    private func configureSubviews() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(loginScreen)
        [logoImageView, loginPasswordStackView, loginButton, passwordLabel].forEach({loginScreen.addSubview($0)})
        [loginTextField, passwordTextField].forEach({loginPasswordStackView.addArrangedSubview($0)})
    }
    
   private func makeElements() {
    
            NSLayoutConstraint.activate([
                
                scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                
                loginScreen.topAnchor.constraint(equalTo: scrollView.topAnchor),
                loginScreen.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                loginScreen.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                loginScreen.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                loginScreen.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                
                logoImageView.topAnchor.constraint(equalTo: loginScreen.topAnchor, constant: 120),
                logoImageView.centerXAnchor.constraint(equalTo: loginScreen.centerXAnchor),
                logoImageView.widthAnchor.constraint(equalToConstant: 100),
                logoImageView.heightAnchor.constraint(equalToConstant: 100),

                loginPasswordStackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
                loginPasswordStackView.leadingAnchor.constraint(equalTo: loginScreen.leadingAnchor, constant: 16),
                loginPasswordStackView.trailingAnchor.constraint(equalTo: loginScreen.trailingAnchor, constant: -16),
                loginPasswordStackView.heightAnchor.constraint(equalToConstant: 100),

                loginButton.topAnchor.constraint(equalTo: loginPasswordStackView.bottomAnchor, constant: 16),
                loginButton.leadingAnchor.constraint(equalTo: loginScreen.leadingAnchor, constant: 16),
                loginButton.trailingAnchor.constraint(equalTo: loginScreen.trailingAnchor, constant: -16),
                loginButton.heightAnchor.constraint(equalToConstant: 50),
                loginButton.bottomAnchor.constraint(equalTo: loginScreen.bottomAnchor, constant: -(UIScreen.main.bounds.height - 506 - topbarHeight - tabbarHeight)),
                
                passwordLabel.topAnchor.constraint(equalTo: loginPasswordStackView.bottomAnchor),
                passwordLabel.centerXAnchor.constraint(equalTo: loginPasswordStackView.centerXAnchor)
            ])
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}

