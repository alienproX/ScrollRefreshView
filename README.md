# ScrollRefreshView

SwiftUI ScrollView with Pull to Refresh.

Use `UIViewControllerRepresentable` wrap UIKit's `UIScrollView` for SwiftUI. Contains Pull to Refresh feature and `scrollViewDidScroll` Event.

```
struct ContentView: View {
    
    @State private var isRefreshing = false
    
    func onRefresh() -> Void {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.isRefreshing = false
        }
    }
    
    func onScroll(size: CGSize, offset: CGPoint) -> Void {
        print("size", size)
        print("offset", offset)
    }
    
    var body: some View {
        ScrollRefreshView($isRefreshing, onRefresh: onRefresh, onScroll: onScroll) {
            LazyVStack {
                ForEach(0..<100, id: \.self) { obj in
                    HStack {
                        Text("\(obj)")
                        Spacer()
                    }
                }
            }.background(Color.gray)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

```
