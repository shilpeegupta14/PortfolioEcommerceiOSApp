//
//  CEnumClass.swift
//  ECommerce
//
//  Created by aditya sharma on 13/08/23.
//

import Foundation
import UIKit

class CEnumClass : NSObject {

    static let sharedEnum = CEnumClass()
    let cateArr = ["New Arrivals", "Clothes", "Bags", "Shoes", "Electronics", "Jevelry"]
    let totalItemArr = ["111 Product", "235 Product", "33 Product", "222 Product", "455 Product", "383 Product"]
    let cateIconArr = ["cart", "tshirt", "bag", "shoeprints.fill", "lightbulb.2", "circle.dotted"]
    // add here links like Base URl and others


    enum S_Enum {
        case  Login,
              Registration
    }

    func showAlert(message:String) -> UIAlertController {

        let actionSheetController: UIAlertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let nextAction: UIAlertAction = UIAlertAction(title: "OK", style: .default) { action -> Void in
        }
        actionSheetController.addAction(nextAction)

        return actionSheetController
    }
    func showAlertTitle(message: String, title: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)

        let nextAction: UIAlertAction = UIAlertAction(title: "OK", style: .default) { action -> Void in
        }
        alert.addAction(nextAction)

        return alert

    }


}


