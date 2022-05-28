//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Елена Земляк on 14.05.2022.
//

import UIKit

class ProfileViewController: UIViewController, LikesCountDelegate {
    var like = 0
    lazy var photoStack: PhotosStack = {
        var photoStack = PhotosStack(firstImage: UIImage(), secondImage: UIImage(), thirdImage: UIImage(), fourthImage: UIImage())
        
        switch photoStorage.count {
        case 0:
            photoStack.firstImage = UIImage()
            photoStack.secondImage = UIImage()
            photoStack.thirdImage = UIImage()
            photoStack.fourthImage = UIImage()
        case 1:
            photoStack.firstImage = photoStorage[0]!
            photoStack.secondImage = UIImage()
            photoStack.thirdImage = UIImage()
            photoStack.fourthImage = UIImage()
        case 2:
            photoStack.firstImage = photoStorage[0]!
            photoStack.secondImage = photoStorage[1]!
            photoStack.thirdImage = UIImage()
            photoStack.fourthImage = UIImage()
        case 3:
            photoStack.firstImage = photoStorage[0]!
            photoStack.secondImage = photoStorage[1]!
            photoStack.thirdImage = photoStorage[2]!
            photoStack.fourthImage = UIImage()
            
        default:
            photoStack.firstImage = photoStorage[0]!
            photoStack.secondImage = photoStorage[1]!
            photoStack.thirdImage = photoStorage[2]!
            photoStack.fourthImage = photoStorage[3]!
        }
    return photoStack
        }()
        
    private lazy var postStorage = [[photoStack],[post1, post2, post3, post4]]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeElements()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true

    }
   
    func likesCount() {
//        like += 1
        self.tableView.reloadData()
    }
    
    func makeElements() {
        view.addSubview(tableView)
    
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
    
    
extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return postStorage.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postStorage[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
            cell.setupCell(photosStack: postStorage[indexPath.section][indexPath.row] as! PhotosStack)
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            cell.setupCell(post: postStorage[indexPath.section][indexPath.row] as! Post)
            
            
       
            return cell
        }
    }
    
    func tableView( _ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let photosVC = PhotosViewController()
            
            photosVC.navigationItem.title = "Photo Gallery"
        }else{

        let post = postStorage[indexPath.section][indexPath.row] as! Post
        
        let detailPostVC = DetailPostViewController()
        
//            self.navigationController?.pushViewController(detailPostVC, animated: true)
        present(detailPostVC, animated: true)
        detailPostVC.authorLabel.text = post.author
        detailPostVC.likesLabel.text = "Likes: \(post.likes)"
        detailPostVC.viewsLabel.text = "Views: \(post.views)"
        detailPostVC.fotoImageView.image = UIImage(named: post.image)!
        detailPostVC.descriptionLabel.text = post.description
            post.views += 1
            tableView.reloadData()
        }
        
       
        //        let cell = tableView.cellForRow(at: indexPath) as! PostTableViewCell
//            cell.delegate = self
        
   
}
}
    
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header = ProfileHeaderView()
            header.pVC = self
            
            return header
        }else{
            return nil
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 220
        }else{
            return 0
        }
    }
}

protocol LikesCountDelegate: AnyObject {
    func likesCount()
}
