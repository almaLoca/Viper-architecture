

import UIKit


//Network Error Codes

enum NTNetworkErrorCodes: Int {
    case userAlredyExits = 409,
    South, East, West
}

enum NTNetworkSuccessCodes:Int{
    case successcode = 200
}

enum NTLoginType:String {
    case Google,Facebook,Native
}


public struct UIConstants {
    
    //FIXME: Need to Remove
    struct Services {
        static let baseApiURL = "https://api.qa.mrhe.gov.ae/mrhecloud/v1.4/docs/public/"
    }
    
    //NTSignupViewController
    
    static let MainStoryboard = "Main"
    
    //StoryBoardName
    struct StoryBoardNameList {
        static let dashBoardName = "Dashboard"
        static let mainStoryBoard = "Main"
        
    }
    
    //StoryBoard Identifier
    struct StoryBoardIdentifier {
        static let questionsListIdentifier = "questionsListView"
        
    }
    
    
    
    struct DConstans {
        static let smallToastDuration : Float = 3.0
        static let longToastDuration = 5.0
        static let serverError = "Technical error. Please try again"
        static let invalidEmailId = "Invalid Email"
        static let noNetworkMessage = "No internet connectivity"
        static let noNetworkTitle = "No internet"
        static let googleLocationAPIKey = "AIzaSyDaEQ6EX3BjsAfBjG3e7woupqWmAiQDsAY"
        static let notAllowedCharacters = "%#$^&?{}[]|\\/+*=<>~$"
    }
    
    
    //Use Application Extensions names List and Programe Identifier
    struct ApplicationExtensions{
        static let userDefaultIdentitifer = ""
    }
    
    struct UserDefaultKeywords {
        static let userIdUserDefaultKey = "UserId"
    }
   
}
//URL_Constants
public struct URLConstants {
     
    static let serverHostUrl = "https://api.qa.mrhe.gov.ae/mrhecloud/v1.4/api/"
    
    static let userLoginUrl = "iskan/v1/certificates/towhomitmayconcern"
    static let getUserList = "v1/news?local=en"
    
}

