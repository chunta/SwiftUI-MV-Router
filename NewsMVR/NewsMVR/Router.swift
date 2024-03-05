import SwiftUI

class Router: ObservableObject {
    enum Route: Hashable {
        static func == (lhs: Router.Route, rhs: Router.Route) -> Bool {
            lhs.hashValue == rhs.hashValue
        }
        case list
        case detail(NewsArticle)
        func hash(into hasher: inout Hasher) {
            switch self {
            case .list:
                hasher.combine(0)
            case .detail(let article):
                hasher.combine(Int(article.articleId))
            }
        }
    }
    
    @Published var path: NavigationPath = NavigationPath()
    
    @ViewBuilder func view(for route: Route, article: NewsArticle?) -> some View {
        switch route {
        case .list:
            NewsListView(viewModel: NewsRepository())
        case .detail:
            NewsDetailView(article: article ?? NewsArticle.zeroArticle())
        }
    }
    
    func naviTo(route: Route) {
        path.append(route)
    }
    
    func naviBack() {
        path.removeLast()
    }
}
