import Foundation

class Post {
    var timestamp:String
    var postTitle:String
    var postDescription:String
    
    init(timestamp:String, postTitle:String, postDescription:String) {
        self.timestamp = timestamp
        self.postTitle = postTitle
        self.postDescription = postDescription
    }
}
