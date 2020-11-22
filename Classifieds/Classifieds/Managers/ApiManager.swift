//
//  ApiManager.swift
//  Classifieds
//
//  Created by Muhammad Nadeem on 21/11/2020.
//

import Foundation
import Alamofire
import SwiftyJSON


/// - Api store do all Networking stuff
///     - build server request
///     - prepare params
///     - and add requests headers
///     - parse Json response to App data models
///     - parse error code to Server error object
///
class ApiManager: NSObject {
    
    // MARK: Data
    let baseURL = "\(AppConfig.appBaseURL)/"
    
    // MARK: Shared Instance
    static let shared: ApiManager = ApiManager()
    
    private override init(){
          super.init()
      }
    
    /**
    make api request and return request
     - parameter url: request url
     - parameter method: http method of request eg: get, post
     - parameter parameters: body parameters
     - parameter completionHandler: closure to return back the success or failure result
     - parameter responseObject: any data response
     - parameter jsonResponse: JSON response object
     - parameter error: error back from server
     */
    func makeRequest(url: String, method: HTTPMethod = .get, parameters: [String: Any]? = nil, completionHandler: @escaping (_ responseObject: AFDataResponse<Any>, _ jsonResponse: JSON?, _ error: Error?) -> Void) -> DataRequest {

        let request = AF.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: []).responseJSON { (responseObject) in
            switch responseObject.result {
            case .success(let value):
                let jsonResponse = JSON(value)
                completionHandler(responseObject, jsonResponse, nil)
            case .failure(_):
                completionHandler(responseObject, nil, responseObject.error)
            }
        }
        return request
    }
    
    class Connectivity {
        class func isConnectedToInternet() -> Bool {
            return NetworkReachabilityManager()?.isReachable ?? false
        }
    }
}
