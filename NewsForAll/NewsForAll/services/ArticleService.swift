import Foundation
import Alamofire
import IHProgressHUD

class ArticleService {
    
    static let shared = ArticleService()
    
    private init() {}
    
    func topArticles(completion: @escaping ([Article]) -> Void) {
        articles(request: Alamofire.request(Router.topHeadLines), completion: completion)
    }
    
    func artiticles(bySelection selection: String, completion: @escaping ([Article]) -> Void) {
        articles(request: Alamofire.request(Router.articles(secetion: selection)), completion: completion)
    }
    
    private func articles(request: DataRequest, completion: @escaping ([Article]) -> Void) {
        IHProgressHUD.show()
        request.responseArticles { response in
            IHProgressHUD.dismiss()
            guard let articles = response.value?.articles else {
                self.handleNetworkError(error: response.error)
                return completion([])
            }
            return completion(articles)
        }
    }
    
    private func handleNetworkError(error: Error?) {
        guard let error = error else {
            return
        }
        Alert.shared.danger(title: error.localizedDescription)
    }
}
