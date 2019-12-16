import UIKit

class LinkTableViewCell: UITableViewCell {

    @IBOutlet weak var linkLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
}
