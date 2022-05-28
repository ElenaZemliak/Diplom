//
//  Post.swift
//  Navigation
//
//  Created by Елена Земляк on 15.05.2022.
//

import Foundation
class Post {
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
    
    init (author: String, description: String, image: String, likes: Int, views: Int){
        self.author = author
        self.description = description
        self.image = image
        self.likes = likes
        self.views = views
    }
    }

