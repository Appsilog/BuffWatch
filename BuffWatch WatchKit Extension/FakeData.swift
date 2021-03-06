//
//  FakeData.swift
//  BuffWatch
//
//  Created by jay on 7/9/15.
//  Copyright © 2015 Appsilog. All rights reserved.
//

import Foundation

class FakeData{
    static let textArray: [String] = [   "This is going to be a great day!",
                        "Top 10 reasons you should",
                        "Why Buffer Will Rule The World",
                        "Coffee vs Tea",
                        "Happiness is what makes up happy",
                        "20 Places to Pass Gas",
                        "Guys or Girls",
                        "Potent Potables",
                        "Colors That Are Red",
                        "States that end in Hampshire",
                        "Catch These Men",
                        "Condiments",
                        "Japan US Relations",
                        "Apetite Dejeuner",
                        "An Album Cover",
                        "The Pen is Mightier",
                        "Therapists",
                        "Current Black Presidents",
                        "Months that start with Feb",
                        "1-Letter Words",
                        "Who Reads",
                        "Drummers named Ringo",
                        "States that begin with 'Calif'",
                        "Make Any Noise",
                        "Colors that end in 'urple'",
                        "How Many Fingers Am I Holding Up?"]
    
    
    class func getPending(numberOfItems: Int = 10, startDate: NSDate = NSDate()) -> [Post]{
        
        let timeBetween: Double = Double(Int((24 * 60 * 60)/numberOfItems))
        
        return get(numberOfItems, startDate: startDate, timeBetween: timeBetween)
    }
    
    class func getSent(numberOfItems: Int = 10, startDate: NSDate = NSDate()) -> [Post]{
        
        
        let timeBetween: Double = Double(Int(-(24 * 60 * 60)/numberOfItems))
        
        return get(numberOfItems, startDate: startDate, timeBetween: timeBetween)
        
    }
    
    private class func get(numberOfItems: Int, startDate: NSDate, timeBetween: Double) -> [Post]{
        var postEntries = [Post]()
        
        var postTime = startDate.dateByAddingTimeInterval(timeBetween)
        
        var rand: UInt32 = 0
        
        for var i = 0; i < numberOfItems; ++i {
            rand = arc4random_uniform(UInt32(textArray.count - 1))
            
            postEntries.append(Post(id: "",
                                    due_at: postTime.timeIntervalSince1970,
                                    text: textArray[Int(rand)]))
            
            // set next post time
            postTime = postTime.dateByAddingTimeInterval(timeBetween)
        }
        
        return postEntries
    }
   
}