

import Foundation

public struct UserDefault {
     
    static func setString(_ value: String, forKey defaultName: String) {
        setObject(value, forKey: defaultName)
    }
    
    static func setObject(_ value: Any?, forKey defaultName: String) {
        //UserDefault.set(value, forKey: defaultName)
    }
    
    /*static func stringForKey(_ defaultName: String) -> String? {
        //return UserDefault.object(forKey: defaultName) as? String
    }*/
    
    
}
