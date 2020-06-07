

import UIKit
import Alamofire
import ObjectMapper

class ServiceManager {
    
    
    //Method Type: Get Only
    static func getMainList(_ completionHandler:@escaping (ListModel) -> Void){
        
        NTNetworking.alamoFireRequest(requestType: .get, requestUrl: URLConstants.getUserList, urlEncoding: URLEncoding.default) { (responceData) in
            if(responceData.result.isSuccess){
               
               // let mainCourseArray = Mapper<ListModel>().map(JSON: responceData.result.value! as! ListModel)
               // "examcategory"
              //  Logger.log(text: mainCourseArray)
                //print(mainCourseArray!)
                //completionHandler(mainCourseArray!)
            }else{
                Logger.log(items: responceData.result)
            }
        }
    }
    //Mathod For User Login Request
    
    static func userLoginRequest(_ userName:String!,email:String!,phone:String!,completionHandler:@escaping (Any) -> Void){
        
        //eid (int) , name (string) , idbarahno (int), emailaddress (string), unifiednumber (Int) ,
        //mobileno (string)
        
        let parameters = [
            "name" : "john" as Any,
            "emailaddress" :"john.smith@mrhe.ae" as Any,
            "mobileno" :"971556987002" as Any,
            "eid" :"123456" as Any,
            "idbarahno" :"123456" as Any,
            "unifiednumber" :"123" as Any,
            
            ] as [String : Any]
        
        Logger.log(items: "User_LoginAPI_Parameters:\(parameters)")
        
        NTNetworking.alamoFireRequest(requestType: .post, requestUrl: URLConstants.userLoginUrl, parameters: parameters,urlEncoding: URLEncoding.default) { (resultData) in
            
            if(resultData.result.isSuccess){
                //Mapping Part for Success
               // var resultDict = resultData as [String:Any]
                Logger.log(items: resultData)
                completionHandler(resultData.debugDescription)
                
            }else{
                //Mapping Part For Failures
                //FIXME: NEED TO Handle Failure Scenarios
                Logger.log(items: resultData)
            }
        }
    }
}

