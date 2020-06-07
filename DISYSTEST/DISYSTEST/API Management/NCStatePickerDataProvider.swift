
import UIKit
import Foundation
import ObjectMapper
import SwiftyJSON

class NCStatePickerDataProvider: NSObject {
    
    /*typealias CompletionHandler = (_ countryList:[StatePickerModelObject]) -> Void
    var responseStateArray = [StatePickerModelObject]()
    func fetchCountryListFrom(fileName: String,completionHandler: CompletionHandler) {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let responseStirng = String(data: data, encoding: .utf8)
                responseStateArray = Mapper<StatePickerModelObject>().mapArray(JSONString: responseStirng!)!
            } catch let error {
                print(error.localizedDescription)
            }
        } else {
            print("Invalid filename/path.")
        }
        completionHandler(responseStateArray)
    }*/
}
