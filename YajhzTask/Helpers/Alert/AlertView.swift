//
//  AlertView.swift
//  YajhzTask
//
//  Created by Sohila Ahmed on 09/01/2024.
//

import Foundation
import UIKit
import CDAlertView

extension UIViewController{ 
    func makeAlert(title: String, SubTitle: String, Image : UIImage) {
        let alert = CDAlertView(title: title, message: SubTitle, type: .notification)
        let doneAction = CDAlertViewAction(title: NSLocalizedString(NSLocalizedString("OK",comment: ""), comment: ""))
        alert.circleFillColor = UIColor.primaryColor
        doneAction.buttonTextColor = UIColor.primaryColor
        alert.add(action: doneAction)
        alert.show()
    }
    
    func makeOkAlertWithAction(title: String, SubTitle: String, btnTitle: String, Image: UIImage, btnClicked:@escaping () -> Bool) {
        let alert = CDAlertView(title: title, message: SubTitle, type: .success)  //.custom(image: Image))
        let doneAction = CDAlertViewAction(title: btnTitle) { action in
            btnClicked()
        }
        alert.circleFillColor = UIColor.second
        doneAction.buttonTextColor = UIColor.white
        doneAction.buttonBackgroundColor = UIColor.second
        alert.add(action: doneAction)
        alert.show()
    }
}
