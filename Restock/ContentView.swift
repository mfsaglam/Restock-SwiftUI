//
//  ContentView.swift
//  Restock
//
//  Created by Fatih Sağlam on 3.09.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var showAddAlert = false
    
    @State var items: [Item] = [
        Item(name: "Amoxicillin", amount: 2.0, kind: .kg),
        Item(name: "Topiramate", amount: 2.0, kind: .piece),
        Item(name: "Ban", amount: 2.0, kind: .kg),
        Item(name: "Ibuprofen", amount: 2.0, kind: .piece),
        Item(name: "Sun Essential", amount: 2.0, kind: .piece)]
    
    @State var secondItems: [Item] = [
        Item(name: "Sosice", amount: 2.0, kind: .kg),
        Item(name: "Bacon", amount: 2.0, kind: .piece),
        Item(name: "Dough", amount: 2.0, kind: .kg),
        Item(name: "Curly Dock", amount: 2.0, kind: .kg),
        Item(name: "Natures Gate", amount: 2.0, kind: .piece),
        Item(name: "Acyclovir", amount: 2.0, kind: .piece)]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Medicines")) {
                    ForEach(items.indices) { index in
                        NavigationLink(destination: DetailView(item: $items[index])) {
                            ItemRow(item: items[index])
                        }
                    }.onDelete(perform: { indexSet in
                        items.remove(atOffsets: indexSet)
                    })
                }
                Section(header: Text("More Medicines")) {
                    ForEach(secondItems.indices) { index in
                        NavigationLink(destination: DetailView(item: $secondItems[index])) {
                            ItemRow(item: secondItems[index])
                        }
                    }.onDelete(perform: { indexSet in
                        secondItems.remove(atOffsets: indexSet)
                    })
                }
            }
            .navigationTitle("All Items")
            .navigationBarItems(leading: EditButton().font(.title3),
                                trailing: Button(action: {
                                    // navigation to form of adding a new item
                                },
                                label: { Image(systemName: "plus").font(.title) })
            )
//            .toolbar { EditButton() }
            .listStyle(SidebarListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
