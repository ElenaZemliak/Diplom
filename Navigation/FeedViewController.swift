//
//  FeedViewController.swift
//  Navigation
//
//  Created by Елена Земляк on 14.05.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    lazy var buttonStackView: UIStackView = {
        let stack = UIStackView ()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var button1: UIButton = {
        let button = UIButton()
        button.setTitle("кнопка 1", for: .normal)
        button.backgroundColor = .lightGray
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
      return button
    }()
    
    lazy var button2: UIButton = {
        let button = UIButton()
        button.setTitle("кнопка 2", for: .normal)
        button.backgroundColor = .lightGray
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
      return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeView()
      
    }
    
    private func makeView(){
        view.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(button1)
        buttonStackView.addArrangedSubview(button2)
        NSLayoutConstraint.activate([
            buttonStackView.widthAnchor.constraint(equalToConstant: 100),
            buttonStackView.heightAnchor.constraint(equalToConstant: 100),
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc private func tapAction() {
        let postVC = PostViewController ()
        navigationController?.pushViewController(postVC, animated: true)

    }
    
}
