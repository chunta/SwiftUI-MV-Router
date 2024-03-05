import SwiftUI

class Router: ObservableObject {
    enum Route: Hashable {
        case viewA
        case viewB
        case viewC
    }

    @Published var path: NavigationPath = NavigationPath()

    @ViewBuilder func view(for route: Route) -> some View {
        switch route {
        case .viewA:
            ViewA()
        case .viewB:
            ViewB()
        case .viewC:
            ViewC()
        }
    }

    func naviTo(route: Route) {
        path.append(route)
    }

    func naviBack() {
        path.removeLast()
    }
}
