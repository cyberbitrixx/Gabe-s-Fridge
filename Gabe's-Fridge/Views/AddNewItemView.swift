//
//  AddNewItemView.swift
//  Gabe's-Fridge
//
//  Created by sofia on 19.07.2025.
//

import Foundation
import SwiftUI

struct AddNewItemView: View {
//    New Item title
//    Item name text field
//    Expiration date field (or date picker idk, decide later)
//    Cancel button
//    Save button
//    Should be presented modally
//    Should cover half of the screen
    @Environment(\.dismiss) var dismiss
    @State private var itemName: String = ""
    @State private var expirationDateString: String = ""
    
    public var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Item name")
                    .font(.headline)
                
                TextField("Milk, eggs etc...", text: $itemName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("Expiration date")
                    .font(.headline)
                
                TextField("mm/dd/yy", text: $expirationDateString)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                HStack {
                    Spacer()
                    
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(.blue)

                    Button("Save") {
                        dismiss()
                        // Save the input data later
                    }
                    .bold()
                }
                Spacer()
            }
            .padding()
            .navigationTitle("New Item")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}



//#Preview {
//    AddNewItemView()
//}
