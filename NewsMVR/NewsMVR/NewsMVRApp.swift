//
//  NewsMVRApp.swift
//  NewsMVR
//
//  Created by Rex Chen on 2024/3/4.
//

import SwiftUI

@main
struct NewsMVRApp: App {
    var body: some Scene {
        WindowGroup {
            NewsListView(viewModel: NewsRepository())
        }
    }
}
