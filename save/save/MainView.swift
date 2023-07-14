//
//  MainView.swift
//  save
//
//  Created by Hai Le on 7/14/23.
//

import SwiftUI

struct MainView: View {
    @State private var showActionSheet = false
    @State private var showBudgetSheet = false
    
    let currentMonth: String
    
    init() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        currentMonth = dateFormatter.string(from: Date())
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("\(currentMonth) Expenses")
                Text("$250")
                    .font(.system(size: 40)) // Makes the text large.
                    .foregroundColor(.green) // Changes the text color to green.
                    .padding() // Adds some padding around the text.

                NavigationLink(destination: AddItemView()) {
                    Text("Add an Expense")
                        .font(.largeTitle) // Big text
                        .padding()
                        .background(Color.accentColor) // Background color
                        .foregroundColor(.white) // Text color
                        .cornerRadius(10) // Rounded corners
                }
                .padding()
                
                Button(action: {
                    showBudgetSheet = true
                }) {
                    Text("Add a budget")
                        .font(.largeTitle) // Big text
                        .padding()
                        .background(Color.accentColor) // Background color
                        .foregroundColor(.white) // Text color
                        .cornerRadius(10) // Rounded corners
                }
                .padding()
                .sheet(isPresented: $showBudgetSheet) {
                    AddBudgetView()
                }
            }
        }
    }
}

struct AddBudgetView: View {
    var body: some View {
        Text("This is where you can add budget related functionality")
            .padding()
    }
}

struct AddItemView: View {
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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
