//
//  ContentView.swift
//  SampleProject
//
//  Created by Ademar on 18/10/21.
//

import SwiftUI

struct MainAppView: View {
    
    @StateObject var viewModel: MainAppViewModel = MainAppViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Add Person")) {
                    ForEach(PersonType.allCases, id: \.self) { pType in
                        Button {
                            switch pType {
                            case .averageJoe:
                                viewModel.addPerson()
                            case .student:
                                viewModel.addStudent()
                            case .teacher:
                                viewModel.addTeacher()
                            case .parent:
                                viewModel.addParent()
                            case .principal:
                                viewModel.addPrincipal()
                            }
                        } label: {
                            HStack {
                                Text("Add \(pType.rawValue)")
                                Spacer()
                                pType.icon
                            }
                        }
                    }
                }
                
                Section(header: Text("Filter")) {
                    HStack {
                        TextField("Search", text: $viewModel.filterText)
                        Button {
                            viewModel.updateList()
                        } label: {
                            Image(systemName: "magnifyingglass")
                        }
                    }
                }
                
                Section(header: Text("Order")) {
                    Picker("Order factor:", selection: $viewModel.selectedFactor) {
                        ForEach(OrderFactor.allCases, id: \.self) { order in
                            Text("\(order.rawValue)")
                        }
                    }
                    
                    Picker("Order by:", selection: $viewModel.selectedOrder) {
                        ForEach(ReturnOrder.allCases, id: \.self) { order in
                            Text("\(order.rawValue)")
                        }
                    }
                }
                
                Section(header: Text("People")) {
                    ForEach(viewModel.peopleList, id: \.id) { person in
                        PersonRowView(person: person)
                    }
                    .onDelete { indexSet in
                        viewModel.deletePerson(at: indexSet)
                    }
                }
            }
            .navigationTitle("People List")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.provider.fillRandomly()
                        viewModel.updateList()
                    } label: {
                        Image(systemName: "lasso.sparkles")
                    }
                    EditButton()
                }
            }
            .onAppear {
                viewModel.updateList()
            }
        }
    }
}

private struct MainAppView_Previews: PreviewProvider {
    static var previews: some View {
        MainAppView()
    }
}
