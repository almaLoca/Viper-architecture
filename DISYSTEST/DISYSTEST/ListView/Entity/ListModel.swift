
import Foundation
import ObjectMapper

private let BASICS = "payload"
private let RELIGIOUS = "RELIGIOUS PREFERENCES"
private let PROFESSIONAL = "PROFESSIONAL PREFERENCES"
private let LOCATION = "LOCATION PREFERENCES"
private let HABIT = "HABITS PREFERENCES"

class ListModel: Mappable {
    
    var BASICDETAILS : [AnyObject]?
    var RELIGIOUSINFO : [AnyObject]?
    var PROFESSIONALINFO : [AnyObject]?
    var RESIDENCE : [AnyObject]?
    var HABITS : [AnyObject]?
    
    required init?(map:Map) {
        mapping(map: map)
    }
    
    func mapping(map:Map){
        
        BASICDETAILS <-  map[BASICS]
        RELIGIOUSINFO <-  map[RELIGIOUS]
        PROFESSIONALINFO <-  map[PROFESSIONAL]
        RESIDENCE <-  map[LOCATION]
        HABITS <-  map[HABIT]
    }
}

