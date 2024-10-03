//
//  EtnaApp.swift
//  Etna
//
//  Created by Tomasz on 01/10/2024.
//

import SwiftUI
import Combine

@main
struct EtnaApp: App {
    @AppStorage("isLogged") private var isLogged: Bool = false
    @AppStorage("needsAppOnboarding") private var needsAppOnboarding: Bool = true
    
    init() {
        if(isLogged == true) {
            
        }
    }
    
    var body: some Scene {
        WindowGroup {
            if(needsAppOnboarding) {
                OnboardingView()
            } else {
                NavigationBarView()
            }
        }
    }
}
