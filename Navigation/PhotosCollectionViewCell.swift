//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Елена Земляк on 24.05.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    private let photoImageView: UIImageView = {
        let photoImageView = UIImageView()
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.clipsToBounds = true
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        return photoImageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(photo: UIImage){
        photoImageView.image = photo
    }
    
    func makeElements() {
        contentView.addSubview(photoImageView)
    
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor)
           
        ])
    }
}
