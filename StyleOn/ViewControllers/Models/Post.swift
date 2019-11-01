//
//  Post.swift
//  StyleOn
//
//  Created by Arturo Fernandez on 11/1/19.
//  Copyright © 2019 Ramses Machado. All rights reserved.
//

import Foundation

class Post {
    var id:String
    var author:String
    var text:String
    
    init(id:String, author:String,text:String) {
        self.id = id
        self.author = author
        self.text = text
    }
}
