import UIKit

class HomeTableViewController: BaseArticleTableViewController {

    private let service = ArticleService.shared
    
    fileprivate func fetch() {
        service.topArticles { articles in
            self.articles = articles
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseArticleDelegate = self
        fetch()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Home"
    }
}

extension HomeTableViewController: BaseArticleTableViewControllerDelegate {
    func refreshed() {
        self.fetch()
    }
    
    func didSelectRow() { }
}
