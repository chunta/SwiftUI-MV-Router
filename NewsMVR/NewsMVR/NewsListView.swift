import SwiftUI

struct NewsListView: View {
    @StateObject var viewModel: NewsRepository
    var body: some View {
        List {
            ForEach(viewModel.newsList) { article in
                Text(article.title ?? "No title")
            }
        }
        .padding()
        .onAppear {
            Task {
                await viewModel.fetchNews()
            }
        }
    }
}

#Preview {
    NewsListView(viewModel: NewsRepository())
}
