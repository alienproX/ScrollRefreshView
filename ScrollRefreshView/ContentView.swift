//
//  ContentView.swift
//  ScrollRefreshView
//
//  Created by Alien Lee on 2020/9/28.
//

import SwiftUI

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
            VStack {
                ForEach(0..<100, id: \.self) { i in
                    HStack {
                        Text("\(i)")
                        Spacer()
                    }
                }
            }.background(Color.gray)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
