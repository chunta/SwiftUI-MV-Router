import SwiftUI

struct ViewA: View {
    @EnvironmentObject var router: Router
    let code = UUID()
    var body: some View {
        VStack {
            Text("This is ViewA")
            Button("To ViewB") {
                router.naviTo(route: .viewB)
            }
        }
        .onAppear {
            print(self.code)
        }
    }

}

#Preview {
    ViewA()
}
