import SwiftUI

struct ViewB: View {
    @EnvironmentObject var router: Router

    var body: some View {
        Text("View - B")
        Button("To A") {
            router.naviTo(route: .viewA)
        }
        Button("To C") {
            router.naviTo(route: .viewC)
        }
    }
}

#Preview {
    ViewB()
}
