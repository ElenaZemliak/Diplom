//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Елена Земляк on 24.05.2022.
//

import UIKit

class PhotosViewController: UIViewController {

    var currentCell:UICollectionViewCell?
    
    lazy var detailPhotoView: UIImageView = {
        let detailPhotoView = UIImageView()
            detailPhotoView.translatesAutoresizingMaskIntoConstraints = false
        return detailPhotoView
    }()
    
    lazy var heightDetailPhotoView = detailPhotoView.heightAnchor.constraint(equalToConstant: 0)
    lazy var widthDetailPhotoView = detailPhotoView.widthAnchor.constraint(equalToConstant: 0)
    lazy var centerXDetailPhotoView = detailPhotoView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
    lazy var centerYDetailPhotoView = detailPhotoView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)

    
    
    private lazy var backView: UIView = {
        let backView = UIView ()
        backView.backgroundColor = .black
        backView.alpha = 0
        backView.translatesAutoresizingMaskIntoConstraints = false
        return backView
   
    }()
    
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
        
        UIView.animate(withDuration: 0.5) {
            self.backView.alpha = 0
            self.widthDetailPhotoView.constant = 0
            self.heightDetailPhotoView.constant = 0
            
            self.view.layoutIfNeeded()
    }
       
    }
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        collection.delegate = self
        collection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeElements()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
   
    private func makeElements() {
        view.addSubview(collectionView)
        view.addSubview(backView)
        view.addSubview(detailPhotoView)
        view.addSubview(exitButton)
        
        NSLayoutConstraint.activate([
            heightDetailPhotoView,
            widthDetailPhotoView,
            centerXDetailPhotoView,
            centerYDetailPhotoView,

        ])
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            exitButton.topAnchor.constraint(equalTo: backView.topAnchor),
            exitButton.trailingAnchor.constraint(equalTo: backView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoStorage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        cell.setupCell(photo: photoStorage[indexPath.row] ?? UIImage())
       return cell
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - (8 * 4) ) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let image = photoStorage[indexPath.item]
        currentCell = collectionView.cellForItem(at: indexPath)
        detailPhotoView.center = currentCell!.center

        
        UIView.animate(withDuration: 0.5) {
            self.backView.alpha = 0.75
            self.detailPhotoView.image = image
            self.detailPhotoView.contentMode = .scaleAspectFill
            self.detailPhotoView.clipsToBounds = true
            self.widthDetailPhotoView.constant = self.view.frame.width
            self.heightDetailPhotoView.constant = self.view.frame.width
            self.view.layoutIfNeeded()
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
}
