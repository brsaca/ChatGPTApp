//
//  ContentView.swift
//  macOS-ChatGPT
//
//  Created by Brenda Saavedra  on 16/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            HistoryView()
        } detail: {
            MainView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
