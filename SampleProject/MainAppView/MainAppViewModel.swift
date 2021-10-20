//
//  MainAppViewModel.swift
//  SampleProject
//
//  Created by Ademar on 18/10/21.
//

import Foundation
import Combine

class MainAppViewModel: ObservableObject {
    
    let provider: PeopleProvider = PeopleProvider.shared
    
    @Published var peopleList: [Person] = []
    
    @Published var filterText: String = ""
    
    @Published var selectedOrder: ReturnOrder = .desc
    
    @Published var selectedFactor: OrderFactor = .name
    
    func updateList() {
        peopleList = provider.getPeople(filterText, selectedOrder, selectedFactor)
    }
    
    func addPerson() {
        let newPerson = RegularPerson(name: "Normal person",
                                      age: Int.random(in: 0...110),
                                      gender: .other("Hill Billy"))
        if provider.addPerson(newPerson) {
            updateList()
        }
    }
    
    func addStudent() {
        
        let newStudent = Student(name: "Student",
                                      age: Int.random(in: 0...110),
                                      gender: .allCases.randomElement())
        if provider.addPerson(newStudent) {
            updateList()
        }
    }
    
    func addTeacher() {
        let newTeacher = Teacher(name: "Teacher",
                                       age: Int.random(in: 0...110),
                                       gender: .allCases.randomElement())
         if provider.addPerson(newTeacher) {
             updateList()
         }
    }
    
    func addParent() {
        let newParent = Parent(name: "Parent",
                                      age: Int.random(in: 0...110),
                                      gender: .allCases.randomElement())
        if provider.addPerson(newParent) {
            updateList()
        }
    }
    
    func addPrincipal() {
        let newPrincipal = Principal(name: "Principal",
                                      age: Int.random(in: 0...110),
                                      gender: .allCases.randomElement())
        if provider.addPerson(newPrincipal) {
            updateList()
        }
    }
    
    func deletePerson(at offsets: IndexSet) {
        provider.removePerson(at: offsets)
        updateList()
    }
}
