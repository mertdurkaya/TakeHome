//
//  TakeHomeApp.swift
//  TakeHome
//
//  Created by Mert Durkaya on 17/02/2024.
//

import SwiftUI

@main
struct TakeHomeApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                PeopleView()
                    .tabItem {
                        Symbols.person
                        Text("Home")
                    }
                ContentView()
                    .tabItem {
                        Symbols.gear
                        Text("Settings")
                    }
            }
        }
    }
}
