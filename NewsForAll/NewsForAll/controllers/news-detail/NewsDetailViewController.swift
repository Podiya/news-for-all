import UIKit
import PINRemoteImage

class NewsDetailViewController: UIViewController {
    
    struct Identifires {
        static let image = "image-cell"
        static let link = "link-cell"
        static let title = "title-cell"
        static let content = "content-cell"
    }
    
    var article: Article!
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate func initTableView() {
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: String(describing: ImageTableViewCell.self), bundle: nil), forCellReuseIdentifier: Identifires.image)
        tableView.register(UINib(nibName: String(describing: LinkTableViewCell.self), bundle: nil), forCellReuseIdentifier: Identifires.link)
        tableView.register(UINib(nibName: String(describing: TitleTableViewCell.self), bundle: nil), forCellReuseIdentifier: Identifires.title)
        tableView.register(UINib(nibName: String(describing: ContentTableViewCell.self), bundle: nil), forCellReuseIdentifier: Identifires.content)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 1000
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = article.source.name
    }
}

extension NewsDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: Identifires.image, for: indexPath) as! ImageTableViewCell
            cell.articleImageView.pin_setImage(from: URL(string: article.urlToImage ?? ""))
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: Identifires.link, for: indexPath) as! LinkTableViewCell
            cell.linkLabel.text = article.url ?? ""
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: Identifires.title, for: indexPath) as! TitleTableViewCell
            cell.titleLabel.text = article.title
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: Identifires.content, for: indexPath) as! ContentTableViewCell
            cell.contentLabel.text = article.content ?? ""
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 300
        default:
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1:
            if let url = URL(string: article.url ?? "") {
                UIApplication.shared.open(url)
            }
        default:
            break
        }
    }
}

