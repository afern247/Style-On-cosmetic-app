import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var post_title: UILabel!
    
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postsImageView: UIImageView!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var postTextLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        postsImageView.layer.cornerRadius = postsImageView.bounds.height / 2
        postsImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(post:Post) {
        postTitle.text = post.author
        postTextLabel.text = post.text
    }
    

    
}
