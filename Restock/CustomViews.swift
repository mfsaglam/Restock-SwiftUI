//
//  CustomViews.swift
//  Restock
//
//  Created by Fatih Sağlam on 5.09.2021.
//

import SwiftUI

struct ItemRow: View {
    var item: Item

    var body: some View {
        HStack {
            Text(item.name)
            Spacer()
            VStack {
                Text(String(format: "%.2f", item.amount))
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(item.kind.rawValue)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct DetailView: View {
    @Binding var item: Item
    
    let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            return formatter
    }()
    
    var body: some View {
        VStack(alignment: .leading) {
            List {
                Section(header: Text("Box Amount")) {
                    TextField("\(item.amount)", value: $item.amount, formatter: formatter)
                }
                
                Section(header: Text("Kind")) {
                    Picker(item.kind.rawValue, selection: $item.kind) {
                        ForEach(Item.ItemKind.allCases, id: \.self) { kind in
                            Text(kind.localizedName)
                                .tag(kind)
                        }
                    }.pickerStyle(MenuPickerStyle())
                }
            }
            .listStyle(GroupedListStyle())
        }
        .navigationTitle(item.name)
        .toolbar {
            
        }
    }
}

struct AddItemForm: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var newItem: Item
    
    let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            return formatter
    }()
    
    var body: some View {
        Form {
            Section {
                TextField("Item Name", text: $newItem.name)
                TextField("Package Amount", value: $newItem.amount, formatter: formatter)
                    .keyboardType(.decimalPad)
                Picker(newItem.kind.rawValue, selection: $newItem.kind) {
                    ForEach(Item.ItemKind.allCases, id: \.self) { kind in
                        Text(kind.localizedName)
                            .tag(kind)
                    }
                }.pickerStyle(MenuPickerStyle())
            }
        }
        .navigationTitle("Create New Item")
        .navigationBarItems(
            leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
            Text("Cancel")
                .foregroundColor(.red)
        }),
            trailing: Button(action: {
                //create new Item and add to the list
            }, label: {
            Text("Done")
        }))
    }
}

struct CustomViews_Previews: PreviewProvider {
    static var previews: some View {
//        NavigationView {
//            DetailView(item: .constant(Item(name: "Test Item", amount: 3.0, kind: .kg)))
//        }
//        ItemRow(item: Item(name: "Test Item", amount: 3.0, kind: .kg))
//            .padding()
        NavigationView {
            AddItemForm(newItem: Item(name: "", amount: 0, kind: .kg))
        }
    }
}
