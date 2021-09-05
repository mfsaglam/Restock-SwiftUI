//
//  Item.swift
//  Restock
//
//  Created by Fatih Sağlam on 5.09.2021.
//

import SwiftUI

struct Item: Identifiable {
    var id = UUID()
    var name: String = "New Item"
    var amount: Float
    var kind: ItemKind = .kg
    
    enum ItemKind: String, Equatable, CaseIterable {
        case kg = "Kg"
        case piece = "Piece"
        
        var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
    }
}
