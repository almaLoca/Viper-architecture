 //
//  DataProvider.swift
//  Study Tech
//
//  Created by Mani on 29/07/19.
//  Copyright © 2018 Manikandan. All rights reserved.
//

import UIKit
import Alamofire

protocol NCDataProviderDelegate : class {
    func onSuccess(resposePayload: Any? , userInfo : NSDictionary)
    func onFailed(errorMessage : String, userInfo : NSDictionary)
}

class NCDataProvider: NSObject {
    
    var apiServiceRequestString : String?
    var delegate : NCDataProviderDelegate?
    var alamofireRequest : Alamofire.Request?
    
    
    func getDataFromURL(url : NSString, requestTypePost: Bool, parameters:Parameters,encodingType: Bool,rawType:Bool) -> Alamofire.Request {
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60 // seconds
        configuration.timeoutIntervalForResource = 60
        
        let userInfo = NSMutableDictionary()
        var methodType:HTTPMethod = HTTPMethod.get
        _ = Alamofire.SessionManager(configuration: configuration)
        
        var encodemethodType:URLEncoding = URLEncoding.default
        var rawmethodType:JSONEncoding = JSONEncoding.default
        
        if encodingType{
             encodemethodType = URLEncoding.httpBody
        } 
        if rawType{
            rawmethodType = JSONEncoding.default
        }
        if requestTypePost{
            methodType = HTTPMethod.post
        }else{
            methodType = HTTPMethod.get
        }
        let headers = ["consumer-key" : "mobile_dev",
                       "consumer-secret": "20891a1b4504ddc33d42501f9c8d2215fbe85008"]
        
        if !rawType{
            alamofireRequest = Alamofire.request(url as String, method: methodType, parameters: parameters,encoding:  encodemethodType,headers: headers).responseJSON { response in
                if(response.result.value != nil) {
                    userInfo.setValue(url, forKey: "RequestedURL")
                    userInfo.setValue(self.alamofireRequest, forKey: "Request")
                    let methodExist = self.delegate?.onSuccess
                    if(methodExist != nil) {
                        var JSON = NSDictionary()
                        
                        if let result = response.result.value {
                            print(response.result.value as Any)
                            
                            if let dictionary = response.result.value as? [AnyHashable: Any] {
                                print("Got a dictionary: \(dictionary)")
                                 
                                JSON = result as! NSDictionary
                                if (JSON.allKeys.count>0){
                                    
                                    if(self.apiServiceRequestString == "LoinApiRequest") {
                                        let finalData : Any = JSON["examcategory"] as Any
                                        self.delegate?.onSuccess(resposePayload: finalData as Any? , userInfo: userInfo)
                                    }
                                    
                                }else{
                                    userInfo.setValue(response.response?.statusCode, forKey: "StatusCode")
                                    self.delegate?.onFailed(errorMessage: (JSON["responseMessage"] as! String) , userInfo: userInfo)
                                    
                                    
                                }
                            }
                            
                        }
                    }
                } else {
                    
                    if(response.response?.statusCode != nil) {
                        userInfo.setValue(response.response?.statusCode, forKey: "StatusCode")
                    }
                    let methodExist = self.delegate?.onFailed
                    if(methodExist != nil) {
                        self.delegate?.onFailed(errorMessage: (response.result.error?.localizedDescription)! , userInfo: userInfo)
                    }
                }
            }
        }else{
            
            alamofireRequest = Alamofire.request(url as String, method: methodType, parameters: parameters,encoding:  rawmethodType).responseJSON { response in
                if(response.result.value != nil) {
                    userInfo.setValue(url, forKey: "RequestedURL")
                    userInfo.setValue(self.alamofireRequest, forKey: "Request")
                    let methodExist = self.delegate?.onSuccess
                    if(methodExist != nil) {
                        var JSON = Array<Any>()
                        if let _ = response.result.value {
                            print(response.result.value as Any)
                            JSON = [response.result.value as Any]
                            
                            if (JSON.count>0){
                                if(self.apiServiceRequestString == "LoinApiRequest") {
                                    
                                    let finalData : Any = JSON[0] as Any
                                    self.delegate?.onSuccess(resposePayload: finalData as Any? , userInfo: userInfo)
                                    
                                } 
                                
                            }else{
                                userInfo.setValue(response.response?.statusCode, forKey: "StatusCode")
                                self.delegate?.onFailed(errorMessage: (JSON as Any as! String) , userInfo: userInfo)
                                
                                
                            }
                        }
                    }
                } else {
                    
                    if(response.response?.statusCode != nil) {
                        userInfo.setValue(response.response?.statusCode, forKey: "StatusCode")
                    }
                    let methodExist = self.delegate?.onFailed
                    if(methodExist != nil) {
                        self.delegate?.onFailed(errorMessage: (response.result.error?.localizedDescription)! , userInfo: userInfo)
                    }
                }
            }
        }
        
        
        

        return alamofireRequest!
    }
    
    func cancelRequest() -> Void {
        alamofireRequest?.cancel()
    }
}

extension String: ParameterEncoding {
    
    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try urlRequest.asURLRequest()
        request.httpBody = data(using: .utf8, allowLossyConversion: false)
        return request
    }
    
}
