import UIKit

protocol BaseArticleTableViewControllerDelegate {
    func refreshed()
    func didSelectRow()
}

class BaseArticleTableViewController: UITableViewController {
    
    var articles = [Article](){
        didSet {
            tableView.reloadData()
        }
    }
    private var cellID = "news-cell"
    var baseArticleDelegate: BaseArticleTableViewControllerDelegate?
    
    fileprivate func initTableView() {
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: String(describing: NewsTableViewCell.self), bundle: nil), forCellReuseIdentifier: cellID)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 1000
    }
    
    fileprivate func initPullToRefresh() {
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
    }
    
    @objc func refresh(sender: Any) {
        refreshControl?.endRefreshing()
        baseArticleDelegate?.refreshed()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        initPullToRefresh()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newsCell = tableView.dequeueReusableCell(withIdentifier: cellID) as! NewsTableViewCell
        let news = articles[indexPath.row]
        newsCell.articleDescription.text = news.articleDescription
        newsCell.title.text = news.title
        newsCell.articleImageVIew.pin_setImage(from: URL(string: news.urlToImage ?? ""))
        newsCell.layoutIfNeeded()
        return newsCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        baseArticleDelegate?.didSelectRow()
        let controller = NewsDetailViewController(nibName: String(describing: NewsDetailViewController.self), bundle: nil)
        controller.hidesBottomBarWhenPushed = true
        controller.article = articles[indexPath.row]
        navigationItem.title = ""
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
