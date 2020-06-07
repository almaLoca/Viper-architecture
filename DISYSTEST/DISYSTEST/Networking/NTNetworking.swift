

import Alamofire

class NTNetworking {
/* This Method Help connect to server
 * This parameters everything alomofire paramerts class followed
 */
    //completionHandler: @escaping (DataResponse<Any>) -> Void)

    static func alamoFireRequest(requestType:HTTPMethod,requestUrl:String,parameters:Parameters? = nil,urlEncoding:URLEncoding,completionHandler:@escaping (DataResponse<String>) -> Void){
        
        let requestFinalUrl = self.getHostUrl(requestUrl)
        Logger.log(text: requestFinalUrl)
        let headers = ["consumer-key" : "mobile_dev",
                       "consumer-secret": "20891a1b4504ddc33d42501f9c8d2215fbe85008"]
        
//        Alamofire.request(requestFinalUrl, method:requestType, parameters: parameters, encoding: urlEncoding, headers: headers).responseJSON { (dataResponce) in
//            Logger.log(items: dataResponce.result)
//            completionHandler(dataResponce)
//        }
        Alamofire.request(requestFinalUrl, method:requestType, parameters: parameters, encoding: urlEncoding, headers: headers).responseString { (dataResponce) in
            Logger.log(items: dataResponce.result)
            completionHandler(dataResponce)
        }
       
    }
   
    static func getHostUrl(_ subStringHost:String)->String{
        return URLConstants.serverHostUrl.appending(subStringHost)
       // self.getHostUrl().appending(requestUrl)
    }
}






















