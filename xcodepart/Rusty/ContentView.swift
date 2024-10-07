//
//  ContentView.swift
//  Rusty
//
//  Created by Garvan Keeley on 2024-10-07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world! \(shipping_rust_add(30, 1))")
                      .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
