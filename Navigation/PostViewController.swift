//
//  PostViewController.swift
//  Navigation
//
//  Created by Елена Земляк on 14.05.2022.
//

import UIKit

class PostViewController: UIViewController {
    var post: Post?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        makeInfoBarButton()
       
    }
    
    private func makeInfoBarButton () {
        let barItem = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(tapAction))
        navigationItem.rightBarButtonItem = barItem
    }

    @objc private func tapAction() {
        let postVC = InfoViewController ()
        present(postVC, animated: true)
       
    
    }

}
