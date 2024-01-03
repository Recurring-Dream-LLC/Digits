//
//  DigitsApp.swift
//  Digits
//
//  Created by Jeff Hokit on 12/26/23.
//

import SwiftUI

@main
struct DigitsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().frame(
                minWidth: 400, maxWidth: 600,
                minHeight: 600, maxHeight: 900)
        }
        .windowResizability(.contentSize)
    }
}
