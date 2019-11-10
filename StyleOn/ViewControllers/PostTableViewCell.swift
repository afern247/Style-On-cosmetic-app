import UIKit

class PostTableViewCell: UITableViewCell {
    

    
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postsImageView: UIImageView!
    @IBOutlet weak var postTextLabel: UILabel!
    @IBOutlet var postAddress: UILabel!
    @IBOutlet var deletePost: UIButton!
    @IBOutlet var editPost: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        //postsImageView.layer.cornerRadius = postsImageView.bounds.height / 2
       // postsImageView.clipsToBounds = true
        
        //postsImageView.layer.cornerRadius = postsImageView.bounds.height / 2
       // postsImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func set(post:Post) {
        
        ImageService.getImage(withURL: post.postUrl) { image in
            self.postsImageView.image = image
        }
        postAddress.text = post.postAddress
        postTitle.text = post.postTitle
        postTextLabel.text = post.postDescription
    }
    
}
