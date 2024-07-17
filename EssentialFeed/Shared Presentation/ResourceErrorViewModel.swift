//
//  ResourceErrorViewModel.swift
//  EssentialFeed
//
//  Created by Jin Zhang on 1/9/24.
//

public struct ResourceErrorViewModel {
    public let message: String?
    
    static var noError: ResourceErrorViewModel {
        return ResourceErrorViewModel(message: nil)
    }
    
    static func error(message: String) -> ResourceErrorViewModel {
        return ResourceErrorViewModel(message: message)
    }
}
