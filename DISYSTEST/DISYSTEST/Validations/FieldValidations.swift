//
//  FieldValidations.swift
//  Study Tech
//
//  Created by Mani on 29/07/19.
//  Copyright © 2018 Manikandan. All rights reserved.
//

import Foundation
import UIKit

class fieldValidation: NSObject{
    //let toastView:CustomToastView = CustomToastView.sharedInstance()

    func isValidEmail(inputtedString:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailResult = NSPredicate(format:"SELF MATCHES %@", emailRegularExpression)
        return emailResult.evaluate(with: inputtedString)
    }
    
    func passwordLengthValid(inputtedString:String) -> Bool {
        guard inputtedString.count < 5 else {
            return true
        }
        return false
    }
   
    func isFieldEmpty(inputtedString:String) -> Bool {
        guard inputtedString.count == 0 || inputtedString.isEmpty else {
            return true
        }
        return false
    }
    
   class func isUserLoggedIn() -> Bool {
    let loginSuccess:Bool? = UserDefaults.standard.object(forKey: "userLoggedIn") as? Bool
        if loginSuccess != nil {
            return true
        }else {
            return false
        }
    }
    
    func networkCheck(currentView:UIView) -> Bool {
        /*if reachabilityManager?.isReachable == true{
            return true
        } else {
            toastView.showToast(subview: currentView, message:"Please check network connectivity", backgroundColor: UIColor.init(colorLiteralRed: 94/255.0, green: 39/255.0, blue: 132/255.0, alpha: 1.0), toastDuration: 4.0, position: toastPosition.bottom, cornerEdges: true)
            return false
        }*/
        return false
    }
    
}
