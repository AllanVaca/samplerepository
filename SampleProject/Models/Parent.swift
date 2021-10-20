//
//  Parent.swift
//  SampleProject
//
//  Created by Alan on 19/10/21.
//

import Foundation

struct Parent: Person {
    var id: UUID = UUID()
    var name: String
    var age: Int?
    var gender: Gender?
    var pType: PersonType = .parent
    
    init(name: String, age: Int? = nil, gender: Gender? = nil) {
        self.name = name
        self.age = age
        self.gender = gender
    }
    
    func extraInfo() -> String {
        return "I'm a parent"
    }
}
