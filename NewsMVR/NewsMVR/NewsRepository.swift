import Foundation

protocol INewsRepository: ObservableObject {
    var newsList: [NewsArticle] { get }
    func fetchNews() async
}

class NewsRepository: INewsRepository {
    @Published var newsList: [NewsArticle] = []

    private let apiKey = "pub_39332bed0999c71020298563c5e2d02b6e018"
    private let url = "https://newsdata.io/api/1/news?q=TaylorSwift&apikey="

    func fetchNews() async {
        let apiUrl = url + apiKey
        guard let url = URL(string: apiUrl) else {
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            if let json = json, let results = json["results"] as? [[String: Any]] {
                let decoder = JSONDecoder()
                let newsArticles: [NewsArticle] = results.compactMap { result -> NewsArticle? in
                    guard let jsonData = try? JSONSerialization.data(withJSONObject: result) else {
                        return nil
                    }
                    return try? decoder.decode(NewsArticle.self, from: jsonData)
                }
                DispatchQueue.main.async {
                    print(newsArticles)
                    self.newsList = newsArticles
                }
            }
        } catch {
            print("Error fetching news: \(error)")
        }
    }
}
