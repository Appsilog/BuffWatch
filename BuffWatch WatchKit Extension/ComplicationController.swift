//
//  ComplicationController.swift
//  BuffWatch WatchKit Extension
//
//  Created by jay on 7/1/15.
//  Copyright © 2015 Appsilog. All rights reserved.
//

import ClockKit


class ComplicationController: NSObject, CLKComplicationDataSource {
    
    // MARK: - Timeline Configuration
    
    func getSupportedTimeTravelDirectionsForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTimeTravelDirections) -> Void) {
        handler([.Forward, .Backward])
    }
    
    func getTimelineStartDateForComplication(complication: CLKComplication, withHandler handler: (NSDate?) -> Void) {
        handler(NSDate())
    }
    
    func getTimelineEndDateForComplication(complication: CLKComplication, withHandler handler: (NSDate?) -> Void) {
       handler(NSDate())
    }
    
    func getPrivacyBehaviorForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationPrivacyBehavior) -> Void) {
        handler(.ShowOnLockScreen)
    }
    
    // MARK: - Timeline Population
    
    func getCurrentTimelineEntryForComplication(complication: CLKComplication, withHandler handler: ((CLKComplicationTimelineEntry?) -> Void)) {
        // Call the handler with the current timeline entry
        handler(nil)
    }
    
    func getTimelineEntriesForComplication(complication: CLKComplication, beforeDate date: NSDate, limit: Int, withHandler handler: (([CLKComplicationTimelineEntry]?) -> Void)) {
        // Call the handler with the timeline entries prior to the given date
        handler(nil)
    }
    
    func getTimelineEntriesForComplication(complication: CLKComplication, afterDate date: NSDate, limit: Int, withHandler handler: (([CLKComplicationTimelineEntry]?) -> Void)) {
        // Call the handler with the timeline entries after to the given date
        handler([])
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
            let modSmallTemp = CLKComplicationTemplateModularSmallSimpleImage()
            let bufferImage = UIImage(named: "Complication/Modular")
            let line1Image  = CLKImageProvider(backgroundImage: bufferImage!, backgroundColor: UIColor.whiteColor())
            
            modSmallTemp.imageProvider = line1Image
            
            template = modSmallTemp
//            
//            let modTemp     = CLKComplicationTemplateModularSmallStackImage()
//            
//            let line2       = CLKSimpleTextProvider(text: "12:12")
//            
//            modTemp.line1ImageProvider = line1Image
//            modTemp.line2TextProvider = line2
//            
//            template        = modTemp
            
        case .ModularLarge:
          template = nil
//            let modularLargeTemplate: CLKComplicationTemplateModularLargeStandardBody = CLKComplicationTemplateModularLargeStandardBody()
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
    
}
