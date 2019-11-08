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

        // Configure the view for the selected state
    }
    
}
