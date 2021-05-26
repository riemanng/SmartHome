import Foundation

enum HTTPMethod: Equatable {
    case get
    case post
    case put
    case delete
    case patch
    
    var methodName: String {
        switch self {
            case .get: return "GET"
            case .post: return "POST"
            case .put: return "PUT"
            case .delete: return "DELETE"
            case .patch: return "PATH"
        }
    }
}
