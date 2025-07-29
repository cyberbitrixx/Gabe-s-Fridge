//
//  AddNewItemView.swift
//  Gabe's-Fridge
//
//  Created by sofia on 19.07.2025.
//

import Foundation
import SwiftUI

/// Modal SwiftUI view for creating a new grocery item with it's expiration date
struct AddNewItemView: View {

    @Environment(\.dismiss) var dismiss // Allows dismissing the modal view
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
