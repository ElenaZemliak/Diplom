//
//  InfoViewController.swift
//  Navigation
//
//  Created by Елена Земляк on 15.05.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        makePostButton()
    }
    
    private func makePostButton () {
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        button.center = view.center
        button.setTitle("выйти", for: .normal)
        button.backgroundColor = .darkGray
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        view.addSubview(button)

    }
    
    @objc func tapAction() {
        let alert = UIAlertController(title: "Выход", message: "Вы точно хотите выйти?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Выйти", style: .default) {_ in self.dismiss(animated: true)}
        let cancelAction = UIAlertAction(title: "Отмена", style: .destructive)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}
