//
//  AppDelegate.swift
//  klEvent_OSX
//
//  Created by 康梁 on 16/1/22.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

import Cocoa
import EventKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    lazy var store = EKEventStore()
    
    var date = NSDate() {
        willSet {
            let calendar = NSCalendar.currentCalendar()
            calendar.timeZone = NSTimeZone(forSecondsFromGMT: 0)
            let components = calendar.components([.Month, .Day, .Year], fromDate: NSDate())
            self.date = calendar.dateFromComponents(components)!
        }
    }
    
    var calendars: [EKCalendar] {
        return self.store.calendarsForEntityType(.Event)
    }
    
    var events: [EKEvent] {
        let endDate = self.date.dateByAddingTimeInterval(24 * 60 * 60)
        let predicate = self.store.predicateForEventsWithStartDate(self.date, endDate: endDate, calendars: self.calendars)
        
        return self.store.eventsMatchingPredicate(predicate)
    }
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        
        self.store.requestAccessToEntityType(.Event) { (success, error) -> Void in
            if !success {
                print(error)
            }
        }

    }
    


}

