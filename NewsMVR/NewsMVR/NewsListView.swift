import SwiftUI

struct NewsListView<Model: INewsRepository>: View {
    @EnvironmentObject var router: Router
    @StateObject var viewModel: Model
    var body: some View {
        List {
            ForEach(viewModel.newsList) { article in
                Text(article.title ?? "No title")
                    .onTapGesture {
                        router.naviTo(route: .detail(article))
                    }
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
