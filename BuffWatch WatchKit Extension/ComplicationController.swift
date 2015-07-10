//
//  ComplicationController.swift
//  BuffWatch WatchKit Extension
//
//  Created by jay on 7/1/15.
//  Copyright © 2015 Appsilog. All rights reserved.
//

import ClockKit


class ComplicationController: NSObject, CLKComplicationDataSource {
    
    let bufferData = BufferAPI()
    
    var posts: [Post]?
    
    // MARK: - Timeline Configuration
    
    func getSupportedTimeTravelDirectionsForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTimeTravelDirections) -> Void) {
        handler([.Forward, .Backward])
    }
    
    func getTimelineStartDateForComplication(complication: CLKComplication, withHandler handler: (NSDate?) -> Void) {
        handler(NSDate())
    }
    
    func getTimelineEndDateForComplication(complication: CLKComplication, withHandler handler: (NSDate?) -> Void) {
       handler(nil)
    }
    
    func getPrivacyBehaviorForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationPrivacyBehavior) -> Void) {
        handler(.ShowOnLockScreen)
    }
    
    // MARK: - Timeline Population
    
    func getCurrentTimelineEntryForComplication(complication: CLKComplication, withHandler handler: ((CLKComplicationTimelineEntry?) -> Void)) {
        
        bufferData.getFakePending() { (postsData, error) -> Void in
            self.posts = postsData
            
            let post = self.posts![0]
            
            
            let modularLargeTemplate = CLKComplicationTemplateModularLargeStandardBody()
            let date = NSDate(timeIntervalSince1970: post.due_at!)
         
            let headerText   = CLKTimeTextProvider(date: date)
            
            let bufferImage = UIImage(named: "Complication/Modular")
            let line1Image  = CLKImageProvider(backgroundImage: bufferImage!, backgroundColor: UIColor.whiteColor())
            
            modularLargeTemplate.headerImageProvider = line1Image
            modularLargeTemplate.headerTextProvider = headerText
            modularLargeTemplate.body1TextProvider = CLKSimpleTextProvider(text: post.text!)
            
            let entry = CLKComplicationTimelineEntry(date: NSDate(), complicationTemplate: modularLargeTemplate)
            
            // Call the handler with the current timeline entry
            handler(entry)
            
           
            
        }
        
        
        
       
    }
    
    func getTimelineEntriesForComplication(complication: CLKComplication, beforeDate date: NSDate, limit: Int, withHandler handler: (([CLKComplicationTimelineEntry]?) -> Void)) {
        // Call the handler with the timeline entries prior to the given date
        handler(nil)
    }
    
    func getTimelineEntriesForComplication(complication: CLKComplication, afterDate date: NSDate, limit: Int, withHandler handler: (([CLKComplicationTimelineEntry]?) -> Void)) {
        // Call the handler with the timeline entries after to the given date
        var entries: [CLKComplicationTimelineEntry] = []
        var prevPostDate: NSDate = NSDate()

        for post in self.posts!
        {
            let startDate = NSDate(timeIntervalSince1970: post.due_at!)
           
            if entries.count < limit && startDate.timeIntervalSinceDate(date) > 0
            {
                
                let modularLargeTemplate = CLKComplicationTemplateModularLargeStandardBody()
                let date = NSDate(timeIntervalSince1970: post.due_at!)
                let headerText   = CLKTimeTextProvider(date: date)
                
                let bufferImage = UIImage(named: "Complication/Modular")
                let line1Image  = CLKImageProvider(backgroundImage: bufferImage!, backgroundColor: UIColor.whiteColor())
                
                modularLargeTemplate.headerImageProvider = line1Image
                modularLargeTemplate.headerTextProvider = headerText
                modularLargeTemplate.body1TextProvider = CLKSimpleTextProvider(text: post.text!)
                
                let entry = CLKComplicationTimelineEntry(date: prevPostDate, complicationTemplate: modularLargeTemplate)
                
                entries.append(entry)
                
                
            }
            
            prevPostDate = startDate
            
        }
        
        handler(entries)
        
      
    }
    
    // MARK: - Update Scheduling
    
    func getNextRequestedUpdateDateWithHandler(handler: (NSDate?) -> Void) {
        // Call the handler with the date when you would next like to be given the opportunity to update your complication content
        handler(NSDate(timeIntervalSinceNow: 60*60))
    }
    
    // MARK: - Placeholder Templates
    

    
    func getPlaceholderTemplateForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTemplate?) -> Void) {
        // This method will be called once per supported complication, and the results will be cached
        var template: CLKComplicationTemplate? = nil
        switch complication.family {
        case .ModularSmall:
            
////          CLKComplicationTemplateModularSmallSimpleImage
////          Just displays the buffer logo
//            let modSmallTemp = CLKComplicationTemplateModularSmallSimpleImage()
//            let bufferImage = UIImage(named: "Complication/Modular")
//            let line1Image  = CLKImageProvider(backgroundImage: bufferImage!, backgroundColor: UIColor.whiteColor())
//            
//            modSmallTemp.imageProvider = line1Image
//            
//            template = modSmallTemp
//
            
////          CLKComplicationTemplateModularSmallSimpleText
////          Shows how many left pending
//            let modSmallTemp = CLKComplicationTemplateModularSmallSimpleText()
//            modSmallTemp.textProvider = CLKSimpleTextProvider(text: "--")
//            
//            template = modSmallTemp
            
            
////            CLKComplicationTemplateModularSmallStackImage
////            Shows buffer image and next post time
            let modTemp     = CLKComplicationTemplateModularSmallStackImage()
            
            let bufferImage = UIImage(named: "Complication/Modular")
            let line1Image  = CLKImageProvider(backgroundImage: bufferImage!, backgroundColor: UIColor.whiteColor())

            let date = NSDate()
            let cal = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
            let newDate = cal!.startOfDayForDate(date)
            let line2   = CLKTimeTextProvider(date: newDate)
            
            modTemp.line1ImageProvider = line1Image
            modTemp.line2TextProvider = line2
            
            template        = modTemp
            
        case .ModularLarge:
////            CLKComplicationTemplateModularLargeTallBody
////            Shows time of next post and brief text in LARGE TEXT
//            let modularLargeTemplate = CLKComplicationTemplateModularLargeTallBody()
//            let date = NSDate()
//            let cal = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
//            let newDate = cal!.startOfDayForDate(date)
//            let headerText   = CLKTimeTextProvider(date: newDate)
//
//            modularLargeTemplate.headerTextProvider = headerText
//            modularLargeTemplate.bodyTextProvider = CLKSimpleTextProvider(text: "this is just a test to see how long this text will be")
//            
//            template = modularLargeTemplate
            
            
////            CLKComplicationTemplateModularLargeStandardBody
////            shows logo, time of next post and text
                let modularLargeTemplate = CLKComplicationTemplateModularLargeStandardBody()
                let date = NSDate()
                let cal = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
                let newDate = cal!.startOfDayForDate(date)
                let headerText   = CLKTimeTextProvider(date: newDate)
    
                let bufferImage = UIImage(named: "Complication/Modular")
                let line1Image  = CLKImageProvider(backgroundImage: bufferImage!, backgroundColor: UIColor.whiteColor())
                
                modularLargeTemplate.headerImageProvider = line1Image
                modularLargeTemplate.headerTextProvider = headerText
                modularLargeTemplate.body1TextProvider = CLKSimpleTextProvider(text: "this is just a test to see how long this text will be")
                
                
                template = modularLargeTemplate
            

//
//            // buffer logo
//            let bufferImage = UIImage(named: "Modular")
//            let imageProvider = CLKImageProvider(backgroundImage: bufferImage!, backgroundColor: UIColor.blackColor())
//            
//            // timestamp
////            let postDate: NSDate = NSDate()
////            let units: NSCalendarUnit = [.Hour, .Minute]
////            let style: CLKRelativeDateStyle = .Natural
//            //let postDateTextProvider = CLKRelativeDateTextProvider(date: postDate, style: style, units: units)
//          let postDateTextProvider = CLKSimpleTextProvider(text: "123")
//            // short text
//            let b1TextProvider = CLKSimpleTextProvider(text: "----")
//            let b2TextProvider = CLKSimpleTextProvider(text: "----")
//            
//            modularLargeTemplate.headerImageProvider = imageProvider
//          
//            modularLargeTemplate.headerTextProvider = postDateTextProvider
//            modularLargeTemplate.body1TextProvider = b1TextProvider
//            modularLargeTemplate.body2TextProvider = b2TextProvider
//            
//            template = modularLargeTemplate
//         

        case .UtilitarianSmall:
            template = nil
        case .UtilitarianLarge:
            template = nil
        case .CircularSmall:
            template = nil
//            let modularTemplate = CLKComplicationTemplateCircularSmallRingText()
//            modularTemplate.textProvider = CLKSimpleTextProvider(text: "--")
//            modularTemplate.fillFraction = 0.7
//            modularTemplate.ringStyle = CLKComplicationRingStyle.Closed
//            template = modularTemplate
            
        }
        handler(template)
        
        
    }
    
    func getPendingCount() -> Int{
        return 25
    }
}
