//
//  SaveStringViewModel.swift
//  CoreNetworkingDemo
//
//  Created by Luiz Vasconcellos on 05/09/24.
//

import Foundation
import CoreNetwork

class SaveStringViewModel: ObservableObject {
    @Published var text: String = ""
    @Published var isLoading: Bool = false
    @Published var responseMessage: String = ""
    
    private let service: SaveStringAPIService
    
    init(service: SaveStringAPIService) {
        self.service = service
    }
    
    func saveString() {
        guard !text.isEmpty else {
            self.responseMessage = "Please, fill the text before save it!"
            return
        }
        isLoading = true
        
        Task { 
            let result = await service.saveString(text)
            
            DispatchQueue.main.async {
                switch result {
                case .success(let resultMessage):
                    self.responseMessage = resultMessage
                case .failure(let error):
                    self.responseMessage = "Sorry we had a problem to save your message!"
                    print("DEBUG:: error to save the string, error message: \(error.localizedDescription)")
                }
                self.isLoading = false
            }
        }
    }
}
