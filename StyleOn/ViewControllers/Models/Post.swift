import Foundation

class Post {
    var timestamp:String
    var postTitle:String
    var postDescription:String
    var postUrl:URL
    
    init(timestamp:String, postTitle:String, postDescription:String, postUrl:URL) {
        self.timestamp = timestamp
        self.postTitle = postTitle
        self.postDescription = postDescription
        self.postUrl = postUrl
    }
}
