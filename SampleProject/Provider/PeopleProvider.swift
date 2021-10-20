//
//  PeopleProvider.swift
//  SampleProject
//
//  Created by Ademar on 18/10/21.
//

import Foundation

final class PeopleProvider {
    
    static var shared: PeopleProvider = PeopleProvider()
    
    var people: [Person] = []
    
    func fillRandomly() {
        var randomPeople: [Person] = []
        for i in people.count..<Int.random(in: (people.count + 1)...(people.count + 8)) {
            let randomInt = Int.random(in: 1...8)
            var temp: Person = RegularPerson(name: "Random Joe #\(i)")
            temp.age = i + 10 * randomInt
            temp.gender = ((randomInt % 2) > 0 ? .male : .female)
            randomPeople.append(temp)
        }
        people.append(contentsOf: randomPeople)
    }
    
    func getPeople(_ search: String, _ order: ReturnOrder? = nil, _ factor: OrderFactor? = nil) -> [Person] {
        var result = search != "" ? filter(&people, search: search) : people
        result = self.order(result, order: order, factor: factor)
        return result
    }
}
