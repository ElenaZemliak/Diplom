//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Елена Земляк on 22.05.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    private let authorLabel: UILabel = {
        let authorLabel = UILabel()
        authorLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        authorLabel.textColor = .black
        authorLabel.numberOfLines = 2
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return authorLabel
    }()
    
    private let fotoImageView: UIImageView = {
        let fotoImageView = UIImageView()
        fotoImageView.contentMode = .scaleAspectFit
        fotoImageView.backgroundColor = .black
        fotoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        return fotoImageView
    }()
    
    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        descriptionLabel.textColor = .systemGray
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return descriptionLabel
    }()
    
    private let likesLabel: UILabel = {
        let likesLabel = UILabel()
        likesLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        likesLabel.textColor = .black
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return likesLabel
    }()
    
    private let viewsLabel: UILabel = {
        let viewsLabel = UILabel()
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
        viewsLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        viewsLabel.textColor = .black
        
        return viewsLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell (post: Post){
        authorLabel.text = post.author
        fotoImageView.image = UIImage(named: post.image)
        descriptionLabel.text = post.description
        likesLabel.text = "Likes: \(post.likes)"
        viewsLabel.text = "Views: \(post.views)"
    }
 
    func makeElements() {
        [authorLabel, fotoImageView, descriptionLabel, likesLabel, viewsLabel].forEach({contentView.addSubview($0)})
    
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            fotoImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 12),
            fotoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            fotoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            fotoImageView.widthAnchor.constraint(equalToConstant: contentView.bounds.width),
            fotoImageView.heightAnchor.constraint(equalToConstant: contentView.bounds.width)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: fotoImageView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),
        ])
    
        NSLayoutConstraint.activate([
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
            likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])

        NSLayoutConstraint.activate([
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
