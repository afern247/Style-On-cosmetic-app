import Foundation

class Post {
    var author:String
    var postTitle:String
    var postDescription:String
    var postUrl:URL
    
    init(author:String, postTitle:String, postDescription:String, postUrl:URL) {
        self.author = author
        self.postTitle = postTitle
        self.postDescription = postDescription
        self.postUrl = postUrl
    }
}
