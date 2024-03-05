import SwiftUI

struct NewsDetailView: View {
    @EnvironmentObject var router: Router
    let article: NewsArticle
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(article.title ?? "No title")
                .font(.title)
                .fontWeight(.bold)
            Spacer()
            if let description = article.description {
                Text(description)
                    .foregroundColor(.white)
            }
            Spacer()
            if let creator = article.creator {
                Text("By \(creator.joined(separator: ", "))")
                    .foregroundColor(.gray)
            }
            
            if let pubDate = article.pubDate {
                Text("Published on \(pubDate)")
                    .foregroundColor(.gray)
            }
        }
        .padding()
    }
}

#Preview {
    NewsDetailView(article: NewsArticle(articleId: "0",
                                        title: "This is the title",
                                        description: "There is always a line at the ladies.",
                                        creator: ["Taylor"],
                                        pubDate: "2019/01/22",
                                        link: "www.google.com"))
}
