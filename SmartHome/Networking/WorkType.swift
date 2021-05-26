import Foundation

enum WorkType {
    case requestPlain
    case requestData(data: Data)
    case requestParameters(_ parameters: [String: Any], _ encoding: JSONEncoder = JSONEncoder())
    case requestWithEncodable(encodable: Encodable)
}
