import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var post_title: UILabel!
    
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postsImageView: UIImageView!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var postTextLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        postsImageView.layer.cornerRadius = postsImageView.bounds.height / 2
        postsImageView.clipsToBounds = true
        
        postsImageView.layer.cornerRadius = postsImageView.bounds.height / 2
        postsImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func set(post:Post) {
        
        ImageService.getImage(withURL: post.postUrl) { image in
            self.postsImageView.image = image
        }
        
        postTitle.text = post.postTitle
        subtitleLabel.text = post.author
        postTextLabel.text = post.postDescription
    }
    
}
