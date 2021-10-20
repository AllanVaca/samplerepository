//
//  PeopleProvider + Extension.swift
//  SampleProject
//
//  Created by Ademar on 18/10/21.
//

import Foundation

extension PeopleProvider {
    
    func filter(_ people: inout [Person], search: String) -> [Person] {
        return people.filter {$0.name.contains(search)}
    }
    
    func order(_ people: [Person], order: ReturnOrder?, factor: OrderFactor?) -> [Person] {
        var ordered: [Person] = people
        var newOrder = order!
        let newFactor = factor != nil ? factor : .name
        
        if order == .rand {
            newOrder = Int.random(in: 0...1) == 0 ? .asc : .desc
        } else if (order == nil) {
            newOrder = .desc
        }

        switch newFactor {
        case .name where newOrder == .asc:
            ordered.sort {$0.name < $1.name}
        case .name where newOrder == .desc:
            ordered.sort {$0.name > $1.name}
        case .age where newOrder == .asc:
            ordered.sort { sortOptionals($0.age, $1.age, newOrder)}
        case .age where newOrder == .desc:
            ordered.sort { sortOptionals($0.age, $1.age, newOrder)}
        case .gender where newOrder == .asc:
            ordered.sort { sortOptionals($0.gender?.value, $1.gender?.value, newOrder)}
        case .gender where newOrder == .desc:
            ordered.sort { sortOptionals($0.gender?.value, $1.gender?.value, newOrder)}
        case .personType where newOrder == .asc:
            ordered.sort {$0.pType.rawValue < $1.pType.rawValue}
        case .personType where newOrder == .desc:
            ordered.sort {$0.pType.rawValue > $1.pType.rawValue}
        default:
            return ordered
        }
        return ordered
    }
    
    func sortOptionals<x: Comparable>(_ v1: x?, _ v2: x?, _ order: ReturnOrder) -> Bool {
        if let c1 = v1, let c2 = v2 {
            return order == .asc ? c1 < c2 : c1 > c2
        }
        return false
    }

    
    func sort(_ v1: Person, _ v2: Person) -> Bool {
        if let e1 = v1.age, let e2 = v2.age {
            return e1 > e2
        }
        return false
    }
    
    func addPerson(_ person: Person) -> Bool {
        if !people.contains(where: {$0.id == person.id}) {
            people.append(person)
            return true
        }
        return false
    }
    
    func removePerson(at offsets: IndexSet) {
        people.remove(atOffsets: offsets)
    }
    
    func editPerson(_ person: Person) -> Bool {
        if let index = people.firstIndex(where: {$0.id == person.id}) {
            people[index] = person
            return true
        }
        return false
    }
    
}
