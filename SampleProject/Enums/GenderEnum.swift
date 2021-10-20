//
//  GenderEnum.swift
//  SampleProject
//
//  Created by Ademar on 18/10/21.
//

import Foundation

enum Gender: CaseIterable {
    static var allCases: [Gender] = [male, female]
    case male
    case female
    case other(String)
    
    var value: String {
        switch self {
        case .male:
            return "male"
        case .female:
            return "female"
        case .other(let string):
            return string
        }
    }
    
}
