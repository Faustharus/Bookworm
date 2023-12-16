//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Damien Chailloleau on 12/12/2023.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
