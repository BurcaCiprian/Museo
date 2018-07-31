//
//  AppError.swift
//  Museo
//
//  Created by Victor Ciprian Burca on 11/04/2018.
//  Copyright © 2018 Victor Ciprian Burca. All rights reserved.
//

import Foundation

public enum AppError: Error {
    case unknownError
    case general(String)
    case missingObject(String)
    case missingData(String)
    case error(String)
}

extension AppError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .unknownError:
            return NSLocalizedString("UnexpectedError", comment: "UnexpectedError")
        case .general(let value):
            return "\(NSLocalizedString("UnexpectedError", comment: "UnexpectedError"))\n\(value)"
        case .missingObject(let value):
            return "\(NSLocalizedString("UnexpectedError", comment: "UnexpectedError"))\nMissing Object: \(value)"
        case .missingData(let value):
            return NSLocalizedString("\(value)", comment: "missingData")
        case .error(let value):
            return NSLocalizedString("\(value)", comment: "Error")
        }
    }
}
