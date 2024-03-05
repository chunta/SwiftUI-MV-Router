import SwiftUI

struct ViewC: View {
    @EnvironmentObject var router: Router

    var body: some View {
        Text("View - C")
        Button("Back") {
            router.naviBack()
        }
    }
}

#Preview {
    ViewC()
}
