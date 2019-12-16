import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    case topHeadLines
    case articles(secetion: String)

    static let baseURLString = "https://newsapi.org/v2"
    static let apiKey = "05c9d8e844694234a7a56578e7c7011c"

    var method: HTTPMethod {
        switch self {
        case .topHeadLines:
            return .get
        case .articles:
            return .get
        }
    }

    var path: String {
        switch self {
        case .topHeadLines:
            return "/top-headlines"
        case .articles(_):
            return "/everything"
        }
    }

    func asURLRequest() throws -> URLRequest {
        let url = try Router.baseURLString.asURL()

        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue

        switch self {
        case .topHeadLines:
            urlRequest = try URLEncoding.default.encode(urlRequest, with: ["country": "us", "apiKey": Router.apiKey])
        case .articles(let selection):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: ["q": selection, "apiKey": Router.apiKey])
        }

        return urlRequest
    }
}
