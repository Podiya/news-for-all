import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var articleImageVIew: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var articleDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
}
