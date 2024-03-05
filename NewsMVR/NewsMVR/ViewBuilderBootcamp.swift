import SwiftUI

struct HeaderView<Content: View>: View {
    let title: String
    let content: Content
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 1)
            content
        }
        .background(Color.red)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 30, trailing: 10))
    }
}

struct ViewBuilderBootcamp: View {
    var body: some View {
        VStack(alignment: .trailing) {
            HeaderView(title: "ss") {
                Text("BottomLine")
                Text("BottomLine2")
                Spacer()
                Text("BottomLine3")
            }
            Spacer()
        }
        .background(Color.blue)
    }
}

#Preview {
    ViewBuilderBootcamp()
}
