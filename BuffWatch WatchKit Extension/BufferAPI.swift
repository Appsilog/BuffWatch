//
//  BufferData.swift
//  BuffWatch
//
//  Created by jay on 7/3/15.
//  Copyright © 2015 Appsilog. All rights reserved.
//

import Foundation

struct Post{
    var id: String?
    var due_at: Double?
    var text: String?
    
}



class BufferAPI: NSObject{
    typealias CompletionPostBlock = (post: [Post]?, error: NSError?) -> ()
    
    func getFakePending(completionHandler: CompletionPostBlock){
        return completionHandler(post: FakeData.getPending(), error: nil)
    }
    
    
    func getFakeSent(completionHandler: CompletionPostBlock){
        return completionHandler(post: FakeData.getSent(), error: nil)
    }
    func getSent(completionHandler: CompletionPostBlock){
        let url: NSURL = NSURL(string: "https://api.bufferapp.com/1/profiles/\(getProfileId())/updates/sent.json?access_token=\(getToken())")!
        
        get(url, completionHandler: completionHandler)
    }
    
    
    func getPending(completionHandler: CompletionPostBlock){
        let url: NSURL = NSURL(string: "https://api.bufferapp.com/1/profiles/\(getProfileId())/updates/pending.json?access_token=\(getToken())")!
        
        get(url, completionHandler: completionHandler)
    }
    
    func get(url: NSURL, completionHandler: CompletionPostBlock) {
        
        let ses = NSURLSession.sharedSession()
        let task = ses.dataTaskWithURL(url, completionHandler: {data, response, error -> Void in
            if (error != nil) {
                return completionHandler(post: nil, error: error)
            }
            
            do{
               
                let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                let updates = json["updates"] as? [NSDictionary]
                let posts = self.populatePosts(updates)
                
                if (error != nil) {
                    return completionHandler(post: nil, error: error)
                } else {
                    return completionHandler(post: posts, error: nil)
                }
            }catch {
                
            }
        })
        task!.resume()
    }
    
    func populatePosts(data: [NSDictionary]?) -> [Post]{
        var posts = [Post]()
        if let data = data {
            for d in data {
                posts.append(Post(  id: d["id"] as? String,
                                    due_at: d["due_at"] as? Double,
                                    text: d["text"] as? String))
            }
        }
        
        return posts
        
    }
    
    func getSent(){
        
    }
    
    
    func valueForAPIKey(keyname: String) -> String{
        let filePath = NSBundle.mainBundle().pathForResource("ApiKeys", ofType: "plist")
        let plist = NSDictionary(contentsOfFile: filePath!)
        
        let value: String = plist?.objectForKey(keyname) as! String
        return value
        
    }
    
    func getProfileId() -> NSString {
        return valueForAPIKey("profile_id")
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
