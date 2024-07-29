//
//  iTour_trainingSwiftDataApp.swift
//  iTour_trainingSwiftData
//
//  Created by Leandro Morais on 29/07/24.
//

import SwiftData
import SwiftUI

@main
struct iTour_trainingSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Destination.self)
    }
}
