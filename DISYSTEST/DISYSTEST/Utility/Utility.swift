
import UIKit
 

public enum ScreenType: String {
    case iPhones_4_4S = "iPhone 4 or iPhone 4S"
    case iPhones_5_5s_5c_SE = "iPhone 5, iPhone 5s, iPhone 5c or iPhone SE"
    case iPhones_6_6s_7_8 = "iPhone 6, iPhone 6S, iPhone 7 or iPhone 8"
    case iPhones_6Plus_6sPlus_7Plus_8Plus = "iPhone 6 Plus, iPhone 6S Plus, iPhone 7 Plus or iPhone 8 Plus"
    case iPhones_X_XS = "iPhone X or iPhone XS"
    case iPhone_XR = "iPhone XR"
    case iPhone_XSMax = "iPhone XS Max"
    case unknown
}

public class Utility: NSObject {
    
    public static func getStoryBoardController(storyName:String,identifier:String) -> UIViewController {
        let getMainStoryBoard = UIStoryboard(name: storyName, bundle: Bundle.main)
        let viewcontroller = getMainStoryBoard.instantiateViewController(withIdentifier: identifier)
        return viewcontroller
    }
    //MARK: User field validation
    public static func isOnlyNumbers(numbersString : String) -> Bool {
        let zipCodeRegexp = "^[1-9][0-9]*$"
        let zipCodeTest = NSPredicate(format:"SELF MATCHES %@", zipCodeRegexp)
        return zipCodeTest.evaluate(with: numbersString)
    }
    
    public static func isValidPassword(password : String) -> Bool {
        let passwordRegEx = "^(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d]{8,20}$"
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: password)
    }
    
    public static func isValidEmail(emailID:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailID)
    }
    
    public static func showToastWith(message : String , duration : Float) -> Void {
       // let toast = Toast(text: message)
        //toast.show()
    }
    
/*
 * This Method Help Check iPhone TopNotch Edge or above iPhoneX Phones
 */
   public static func hasTopNotch()->Bool{
        if #available(iOS 11.0,  *) {
            return UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 20
        }
        return false
    }
    
    public static func screensType()->ScreenType{
        switch UIScreen.main.nativeBounds.height {
        case 960:
            return .iPhones_4_4S
        case 1136:
            return .iPhones_5_5s_5c_SE
        case 1334:
            return .iPhones_6_6s_7_8
        case 1792:
            return .iPhone_XR
        case 1920, 2208:
            return .iPhones_6Plus_6sPlus_7Plus_8Plus
        case 2436:
            return .iPhones_X_XS
        case 2688:
            return .iPhone_XSMax
        default:
            return .unknown
        }
    }
}
