//
//  DetailPostViewController.swift
//  Navigation
//
//  Created by Елена Земляк on 28.05.2022.
//

import UIKit

class DetailPostViewController: UIViewController {
    
    var authorLabel: UILabel = {
        let authorLabel = UILabel()
        authorLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        authorLabel.textColor = .black
        authorLabel.numberOfLines = 2
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return authorLabel
    }()
    
   var fotoImageView: UIImageView = {
        let fotoImageView = UIImageView()
        fotoImageView.contentMode = .scaleAspectFit
        fotoImageView.contentMode = .scaleAspectFill
        fotoImageView.clipsToBounds = true
        fotoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        return fotoImageView
    }()
    
    var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        descriptionLabel.textColor = . black
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return descriptionLabel
    }()
    
   var likesLabel: UILabel = {
        let likesLabel = UILabel()
        likesLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        likesLabel.textColor = .black
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
       
        return likesLabel
    }()
    
     var viewsLabel: UILabel = {
        let viewsLabel = UILabel()
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
        viewsLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        viewsLabel.textColor = .black
        
        return viewsLabel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        makeElements()
        view.backgroundColor = .white
    }
    
    func makeElements() {
        [authorLabel, fotoImageView, descriptionLabel, likesLabel, viewsLabel].forEach({view.addSubview($0)})
    
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            authorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            fotoImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 12),
            fotoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            fotoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            fotoImageView.widthAnchor.constraint(equalToConstant: view.bounds.width),
            fotoImageView.heightAnchor.constraint(equalToConstant: view.bounds.width)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: fotoImageView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16),
        ])
    
        NSLayoutConstraint.activate([
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
         
    ])

        NSLayoutConstraint.activate([
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            viewsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
          
        ])
    }

}
