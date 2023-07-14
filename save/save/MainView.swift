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
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: AddItemView()) {
                    Text("Add an item")
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
    var body: some View {
        Text("This is where you can add item related functionality")
            .padding()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
