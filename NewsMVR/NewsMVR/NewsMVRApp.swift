import SwiftUI

@main
struct NewsMVRApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView {
                NewsListView(viewModel: NewsRepository())
            }
        }
    }
}
