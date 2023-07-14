//
//  AddExpenseView.swift
//  save
//
//  Created by Hai Le on 7/14/23.
//

import SwiftUI

struct AddExpenseView: View {
    @State private var dollarAmount = ""
    @State private var itemName = ""
    @State private var selectedCategory = "Category 1"
    
    // Your categories
    private let categories = ["Category 1", "Category 2", "Category 3"]
    
    var body: some View {
        Form {
            TextField("Dollar Amount", text: $dollarAmount)
                .keyboardType(.decimalPad)
            
            TextField("Item Name", text: $itemName)
            
            Picker("Category", selection: $selectedCategory) {
                ForEach(categories, id: \.self) {
                    Text($0)
                }
            }
            Button(action: {
                // Handle save action
                print("Save button tapped!")
                print("Dollar Amount: \(dollarAmount)")
                print("Item Name: \(itemName)")
                print("Selected Category: \(selectedCategory)")
            }) {
                Text("Save")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.top)
        }
        .navigationBarTitle("Add an Item", displayMode: .inline)
    }
}
