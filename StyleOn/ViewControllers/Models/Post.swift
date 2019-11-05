import Foundation

class Post {
    var id:String
    var postTitle:String
    var text:String
    
    init(id:String, postTitle:String, text:String) {
        self.id = id
        self.postTitle = postTitle
        self.text = text
    }
}
