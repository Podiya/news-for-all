import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var articleImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
}
