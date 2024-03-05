import SwiftUI

struct RouterView<Content: View>: View {
    @StateObject var router: Router = Router()
    private let content: Content
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationStack(path: $router.path) {
            content.navigationDestination(for: Router.Route.self) { route in
                switch route {
                case .list:
                    router
                        .view(for: route, article: nil)                    .navigationBarBackButtonHidden(true)
                    
                case .detail(let article):
                    router
                        .view(for: route, article: article)
                        .navigationBarBackButtonHidden(true)
                        .toolbar {
                            ToolbarItem(placement: .topBarLeading) {
                                Button(action: {
                                    router.naviBack()
                                }) {
                                    Label("Back", systemImage: "arrow.left.circle")
                                }
                            }
                        }
                }
            }
        }
        .environment(\.colorScheme, .dark)
        .environmentObject(router)
    }
}

#Preview {
    RouterView<NewsListView>(content: {
        NewsListView(viewModel: NewsRepository())
    })
}
