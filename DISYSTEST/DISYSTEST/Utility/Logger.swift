
import Foundation
public struct Logger {
    
    public static func log(text: String) {
        #if DEBUG
            print(text, separator: " ", terminator: "\n")
        #endif
    }
    
    public static func log(items: Any...) {
        #if DEBUG
            debugPrint(items, separator: " ", terminator: "\n")
        #endif
    }
}
