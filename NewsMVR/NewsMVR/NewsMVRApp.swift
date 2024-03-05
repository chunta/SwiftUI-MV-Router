import SwiftUI

@main
struct NewsMVRApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView {
                ViewA()
            }
        }
    }
}
