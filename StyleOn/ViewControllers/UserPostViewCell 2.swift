import UIKit

class UserPostViewCell: UITableViewCell {
    
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var stylerName: UILabel!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postDescription: UILabel!
    @IBOutlet weak var postAddress: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func set(userPost:UserPosts) {
        
        ImageService.getImage(withURL: userPost.postUrl) { image in
            self.postImage.image = image
        }
        
        postTitle.text = userPost.postTitle
        stylerName.text = userPost.author
        postDescription.text = userPost.postDescription
        postAddress.text = userPost.postAddress
    }

    
}

