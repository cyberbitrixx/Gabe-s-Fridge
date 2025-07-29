//
//  SwiftUIViewPresenter.swift
//  Gabe's-Fridge
//
//  Created by sofia on 28.07.2025.
//

import Foundation
import UIKit
import SwiftUI

@objc class SwiftUIViewPresenter: NSObject {
    @objc static func createAddNewItemViewController() -> UIViewController {
        let view = AddNewItemView()
        let hostingController = UIHostingController(rootView: view)
        
        if let sheet = hostingController.sheetPresentationController {
            sheet.detents = [.medium()] // Cover half of the screen
            sheet.prefersGrabberVisible = true // Show the grabber bar under the top of the modal
            sheet.preferredCornerRadius = 20 // Sheet coreners radius
        }
        
        return hostingController
    }
}
