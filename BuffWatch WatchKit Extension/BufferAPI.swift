//
//  BufferData.swift
//  BuffWatch
//
//  Created by jay on 7/3/15.
//  Copyright © 2015 Appsilog. All rights reserved.
//

import Foundation

extension NSURLSession {
    class func fetchDataFromURL(url: NSURL, completionHandler: (NSData) -> ()) -> NSURLSessionDataTask {
        return self.sharedSession().dataTaskWithURL(url) { data, _, _ in
            if let actualData = data {
                completionHandler(actualData)
            }
        }!
    }
}

class BufferAPI: NSObject{
    
    let CONSTANTS = Constants()
    
    
    func getPending(completion: (posts: [Post], error: NSError?) -> Void) {
        
        let url = NSURL(string: Constants.UPDATES_PENDING)
        let session = NSURLSession.sharedSession()
        
        session.dataTaskWithURL(url!) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            
            let jsonError: NSError?
            let jsonData: NSData = data!
           
            let jsonDict = NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
            
            let JSONData = Post(JSONDictionary: jsonDict)
            print(data, appendNewline: true)
            
        }
        
    }
    
    func getSent(){
        
    }
    
    
    func valueForAPIKey(keyname: String) -> String{
        let filePath = NSBundle.mainBundle().pathForResource("ApiKeys", ofType: "plist")
        let plist = NSDictionary(contentsOfFile: filePath!)
        
        let value: String = plist?.objectForKey(keyname) as! String
        
        return value
        
    }
    func getToken() -> NSString{
       
        return valueForAPIKey("user_token")
    }
    
  
    
   
    
   }

// BufferAPI.sharedInstance.profiles()
// BufferAPI.sharedInstance.profiles(id: "1212121312")
// BufferAPI.sharedInstance.profiles(id: "12312412432").getSchedules(){
// }



// bufferAPI.sharedInstance.updates(id: "12124213").getInteractions()
// bufferAPI.sharedInstance.profiles(id: "1231341").getPending()
// bufferAPI.sharedInstance.profiles(id: "1231213").getSent()
