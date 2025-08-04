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
    @FocusState private var focus: FieldFocus? // Passed to select the right field automatically when modal appears
    
    public var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Item name")
                    .font(.headline)
                TextField("Milk, eggs etc...", text: $itemName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onSubmit() {
//                        Playing
                        print("Input submitted")
                        focus = .expirationDate // When pressed enter, select expiratoin date field
                    }
                    .focused($focus, equals: .name) // Select name text field when modal appears
                
                Text("Expiration date")
                    .font(.headline)
                TextField("mm/dd/yy", text: $expirationDateString)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .focused($focus, equals: .expirationDate)
                
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
            .onAppear() {
                focus = .name
            } // Focus the cursor on the first field once modal appears
        }
    }
    
    /// Options for switching between what field should be selected automatically
    enum FieldFocus: Hashable {
        case name
        case expirationDate
    }
}
