//
//  CoreNetworkingDemoApp.swift
//  CoreNetworkingDemo
//
//  Created by Luiz Vasconcellos on 04/09/24.
//

import SwiftUI
import CoreNetwork

@main
struct CoreNetworkingDemoApp: App {
    var body: some Scene {
        WindowGroup {
            let networkManager = NetworkManager(session: URLSession.shared)
            let service = SaveStringAPIService(networkManager: networkManager as NetworkManagerProtocol)
            let saveStringViewModel = SaveStringViewModel(service: service)
            
            ContentView(viewModel: saveStringViewModel)
        }
    }
}
