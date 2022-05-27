//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Елена Земляк on 24.05.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    private let photosLabel: UILabel = {
        let photosLabel = UILabel()
        photosLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        photosLabel.textColor = .black
        photosLabel.text = "Photos"
        photosLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return photosLabel
    }()
    
    private lazy var firstPhotoImageView: UIImageView = {
        let photoImageView = UIImageView()
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.clipsToBounds = true
        photoImageView.layer.cornerRadius = 6
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        return photoImageView
    }()
    
    private let secondPhotoImageView: UIImageView = {
        let photoImageView = UIImageView()
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.clipsToBounds = true
        photoImageView.layer.cornerRadius = 6
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        return photoImageView
    }()
    
    private let thirdPhotoImageView: UIImageView = {
        let photoImageView = UIImageView()
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.clipsToBounds = true
        photoImageView.layer.cornerRadius = 6
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        return photoImageView
    }()
    
    private let fourthPhotoImageView: UIImageView = {
        let photoImageView = UIImageView()
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.clipsToBounds = true
        photoImageView.layer.cornerRadius = 6
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        return photoImageView
    }()
    
    lazy var photosStackView: UIStackView = {
        let stack = UIStackView ()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
       
        return stack
    }()
    
    lazy var galleryButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell (photosStack: PhotosStack){
        firstPhotoImageView.image = photosStack.firstImage
        secondPhotoImageView.image = photosStack.secondImage
        thirdPhotoImageView.image = photosStack.thirdImage
        fourthPhotoImageView.image = photosStack.fourthImage
    }
 
    func makeElements() {
        [firstPhotoImageView,secondPhotoImageView, thirdPhotoImageView,fourthPhotoImageView].forEach({photosStackView.addArrangedSubview($0)})
        [photosLabel,photosStackView, galleryButton].forEach({contentView.addSubview($0)})
    
        NSLayoutConstraint.activate([
            photosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 12),
        ])
        
        NSLayoutConstraint.activate([
            galleryButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            galleryButton.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            photosStackView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            photosStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 12),
            photosStackView.heightAnchor.constraint(equalToConstant: ((UIScreen.main.bounds.width - (12 * 2) - (8 * 3)) / 4)),
            photosStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            photosStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12)
        ])
    }
}
