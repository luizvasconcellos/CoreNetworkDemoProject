//
//  ContentView.swift
//  CoreNetworkingDemo
//
//  Created by Luiz Vasconcellos on 04/09/24.
//

import SwiftUI
#if targetEnvironment(simulator)
import CoreNetwork
#endif

struct ContentView: View {
    @StateObject private var viewModel: SaveStringViewModel
    
    init(viewModel: SaveStringViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            Text("Hi, this is a simple example of how to use the SaveString API and CoreNetwork Framework!")
            
            TextField("Text to be saved", text: $viewModel.text)
                .textFieldStyle(.roundedBorder)
                .font(.subheadline)
                .padding(.vertical)
            
            Button {
                viewModel.saveString()
            } label: {
                Text("Save")
                    .foregroundStyle(.white)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 48)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
            if viewModel.isLoading {
                ProgressView()
                    .padding()
            }
            
            Text(viewModel.responseMessage)
                .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView(viewModel: SaveStringViewModel(service: SaveStringAPIService(networkManager: NetworkManager() as NetworkManagerProtocol)))
}
