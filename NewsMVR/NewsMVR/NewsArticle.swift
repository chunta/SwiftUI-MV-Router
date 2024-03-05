import Foundation

struct NewsArticle: Identifiable, Decodable {
    let id = UUID()
    let article_id: String
    let title: String?
    let creator: [String]?
    let pubDate: String?
    let link: String?

    enum CodingKeys: String, CodingKey {
        case article_id
        case title
        case creator
        case pubDate
        case link
    }
}
