//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Елена Земляк on 16.05.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    var pVC: ProfileViewController?
    
    var minSizeValueOfScreen = {
        return UIScreen.main.bounds.width > UIScreen.main.bounds.height ? UIScreen.main.bounds.height : UIScreen.main.bounds.width
        
    }
    override init(frame: CGRect) {
        super .init(frame: frame)
        makeElements()
        setupGestures()
    }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
    
    
    lazy var avatarView: UIView = {
        let avatarView = UIView ()
        avatarView.backgroundColor = .black
        avatarView.alpha = 0
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        return avatarView
    }()
    
    
    
    
    lazy var avatarWidth = avatarImage.widthAnchor.constraint(equalToConstant: minSizeValueOfScreen()/4)
    lazy  var avatarHeight =  avatarImage.heightAnchor.constraint(equalToConstant: minSizeValueOfScreen()/4)
    lazy  var avatarTopAnchor =  avatarImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16)
    lazy  var avatarLeadingAnchor =  avatarImage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16)
    lazy  var avatarTrailingAnchor =  avatarImage.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -(UIScreen.main.bounds.width - 16 - minSizeValueOfScreen()/4))
   
    lazy var avatarImage: UIImageView = {
        let avatarImage = UIImageView ()
        avatarImage.contentMode = .scaleAspectFill
        avatarImage.clipsToBounds = true
        avatarImage.layer.cornerRadius = minSizeValueOfScreen() / 8
        avatarImage.layer.borderWidth = 3
        avatarImage.layer.borderColor = UIColor.white.cgColor
        avatarImage.image = UIImage(named: "9560edf8bfbb40b09975d77e10e81484")
        avatarImage.isUserInteractionEnabled = true
        avatarImage.translatesAutoresizingMaskIntoConstraints = false

        return avatarImage
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textColor = .black
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        nameLabel.textAlignment = .left
        nameLabel.text = "Геральт из Ривии"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    lazy var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.textColor = .gray
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.textAlignment = .left
        statusLabel.text = "Нет Предназначения…"
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        return statusLabel
    }()
    
    lazy var statusButton: UIButton = {
        let statusButton = UIButton ()
        statusButton.setTitle("Set status", for: .normal)
        statusButton.setTitleColor(.white, for: .normal)
        statusButton.backgroundColor = .systemBlue
        statusButton.layer.cornerRadius = 4
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOpacity = 0.7
        statusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        return statusButton
    }()
    
    lazy var statusTextField: UITextField = {
    let statusTextField = UITextField ()
        statusTextField.font = UIFont .systemFont(ofSize: 15, weight: .regular)
        statusTextField.textColor = .black
        statusTextField.backgroundColor = .white
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.cornerRadius = 12
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        statusTextField.delegate = self
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        return statusTextField
    }()
    
    private var statusText: String = ""
    
    @objc private func statusTextChanged(textField: UITextField) {
       
        if (textField.text?.count ?? 0) <= 27 {
            statusText = (textField.text ?? "")
        }else{
            textField.text = String((textField.text ?? "").prefix(27))
        }
    }
    
    @objc private func buttonPressed() {
        if statusText != ""{
            statusLabel.text = statusText
            statusText = ""
            statusTextField.text = ""
        }
    }
    
    lazy var exitButton: UIButton = {
        let exitButton = UIButton ()
        exitButton.setImage(UIImage(systemName: "clear"), for: .normal)
        exitButton.backgroundColor = .white
        exitButton.layer.cornerRadius = 4
        exitButton.alpha = 0
        exitButton.addTarget(self, action: #selector(exitButtonPressed), for: .touchUpInside)
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        exitButton.isUserInteractionEnabled = false
        return exitButton
    }()
    
    @objc func exitButtonPressed() {
        
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: .curveEaseInOut)
        {
            self.exitButton.alpha = 0
            self.exitButton.isUserInteractionEnabled = false
         }
    completion: { _ in
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: .curveEaseInOut)
        {
            self.avatarView.alpha = 0
            self.avatarImage.layer.cornerRadius = self.minSizeValueOfScreen() / 8
            self.avatarImage.layer.borderWidth = 3
            self.avatarWidth.constant = self.minSizeValueOfScreen()/4
            self.avatarHeight.constant = self.minSizeValueOfScreen()/4
            self.avatarLeadingAnchor.constant = 16
            self.avatarTrailingAnchor.constant = -(UIScreen.main.bounds.width - 16 - self.minSizeValueOfScreen()/4)
            self.avatarTopAnchor.constant = 16
            self.layoutIfNeeded()
         }
    }
    }
    
    func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        avatarImage.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tapAction (){
       
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: .curveEaseInOut)
        {
//
            self.avatarView.alpha = 0.75
            self.avatarImage.layer.cornerRadius = 0
            self.avatarImage.layer.borderWidth = 0
            self.avatarWidth.constant = self.avatarView.frame.width
            self.avatarHeight.constant = self.avatarView.frame.width
            self.avatarLeadingAnchor.constant = 0
            self.avatarTrailingAnchor.constant = 0
            self.avatarTopAnchor.constant = UIScreen.main.bounds.height / 2 - UIScreen.main.bounds.width/2 - (self.pVC?.tabbarHeight ?? 0)
            self.layoutIfNeeded()
         }
    completion: { _ in
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: .curveEaseInOut)
        {
            self.exitButton.alpha = 1
            self.exitButton.isUserInteractionEnabled = true
         }
    }
    }
    
    
    func makeElements() {
        [nameLabel, statusLabel, statusButton, statusTextField, avatarView, avatarImage, exitButton].forEach({self.addSubview($0)})
        NSLayoutConstraint.activate([
            avatarTopAnchor,
            avatarLeadingAnchor,
            avatarWidth,
            avatarHeight,
            avatarTrailingAnchor
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            nameLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            statusButton.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 16 + 25),
            statusButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            statusButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
        NSLayoutConstraint.activate([
            exitButton.topAnchor.constraint(equalTo: avatarView.topAnchor),
            exitButton.trailingAnchor.constraint(equalTo: avatarView.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            statusLabel.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -34 - 25),
            statusLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
            statusTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            avatarView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            avatarView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            avatarView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            avatarView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height)
        ])
    }
}

extension ProfileHeaderView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return true
    }
}
