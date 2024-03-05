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
                router
                    .view(for: route)
                    .navigationBarBackButtonHidden(true)
            }
        }
        .environment(\.colorScheme, .dark)
        .environmentObject(router)
    }
}

#Preview {
    RouterView<ViewA>(content: {
        ViewA()
    })
}
