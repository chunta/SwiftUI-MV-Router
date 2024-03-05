import Foundation

struct NewsArticle: Identifiable, Decodable {
    let id = UUID()
    let articleId: String
    let title: String?
    let description: String?
    let creator: [String]?
    let pubDate: String?
    let link: String?

    enum CodingKeys: String, CodingKey {
          case articleId = "article_id"
          case title
          case description
          case creator
          case pubDate
          case link
      }
    
    static func zeroArticle() -> NewsArticle {
        NewsArticle(articleId: "", title: "Not Found", description: "", creator: [], pubDate: "", link: "")
    }
}
