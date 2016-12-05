//
//  ViewController.swift
//  CalendarCollectionView
//
//  Created by Sophia KC on 12/1/16.
//  Copyright © 2016 Sophia KC. All rights reserved.
//

import Foundation
import UIKit

struct TableItem {
//    let month: String
    let weekDay: String
    let weekDate: String
//    let weekDay: String
//    let weekDate: String
}

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Variables
    var entries: [Entry] = []
    
    // AFDateHelper
    let now = Date()
    var date = Date()
    
    var sections:[String] = []
    var items:[[TableItem]] = []
    var sectionItems = [TableItem]()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        ///// With Charlie
        // Parse query and fetch for entries
        // load that into entrie

        /*
        // compose view controller
        let newEntry = Entry()
        newEntry.text = "I had a wonderful day!"
        newEntry.wordCount = 5
        newEntry.date = NSDate()
        // newEntry.user = currentUser
        // var newEntryPF = PFObject()
        // newEntryPF["text"] = newEntry.text
        // .saveInBeackgroundWithBlock() {
        // }
 */

        // let newEntry = PFObject()
        // newEntry["text"] = some text
        // newEntry["wordCount"] = wordCount
        
        
        
        
        
        // From DateHelper extension
        
    
        // Not sure how Section works for CollectionView ???
        sections.append(now.monthToString()) // DECEMBER
        var sectionItems = [TableItem]()
        
        // Ideally we want to register 1. When the user sign in the first time
        // So that it will start the calendar, until today's date
        
        
        // Today-9
        sectionItems.append(TableItem(weekDay: now.dateBySubtractingDays(9).shortWeekdayToString(), weekDate: now.dateBySubtractingDays(9).toString(.custom("d"))))
        
        // Today-8
        sectionItems.append(TableItem(weekDay: now.dateBySubtractingDays(8).shortWeekdayToString(), weekDate: now.dateBySubtractingDays(8).toString(.custom("d"))))
        
        // Today-7
        sectionItems.append(TableItem(weekDay: now.dateBySubtractingDays(7).shortWeekdayToString(), weekDate: now.dateBySubtractingDays(7).toString(.custom("d"))))
        
        // Today-6
        sectionItems.append(TableItem(weekDay: now.dateBySubtractingDays(6).shortWeekdayToString(), weekDate: now.dateBySubtractingDays(6).toString(.custom("d"))))
        
        // Today-5
        sectionItems.append(TableItem(weekDay: now.dateBySubtractingDays(5).shortWeekdayToString(), weekDate: now.dateBySubtractingDays(5).toString(.custom("d"))))
        
        // Today-4
        sectionItems.append(TableItem(weekDay: now.dateBySubtractingDays(4).shortWeekdayToString(), weekDate: now.dateBySubtractingDays(4).toString(.custom("d"))))
        
        // Today-3
        sectionItems.append(TableItem(weekDay: now.dateBySubtractingDays(3).shortWeekdayToString(), weekDate: now.dateBySubtractingDays(3).toString(.custom("d"))))
        
        
        // Today-2
        sectionItems.append(TableItem(weekDay: now.dateBySubtractingDays(2).shortWeekdayToString(), weekDate: now.dateBySubtractingDays(2).toString(.custom("d"))))
        
        // Yesterday
        sectionItems.append(TableItem(weekDay: now.dateBySubtractingDays(1).shortWeekdayToString(), weekDate: now.dateBySubtractingDays(1).toString(.custom("d"))))
        
        // Today
        sectionItems.append(TableItem(weekDay: now.shortWeekdayToString(), weekDate: now.toString(.custom("d"))))
            
        
        items.append(sectionItems)
        
    }
    
    
    // From DateHelper file
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return items.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 30
        return items[section].count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        let item = items[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]
        cell.dayLabel.text = item.weekDay
        cell.dateLabel.text = item.weekDate
        
        // Print the 2 bubbles
        let originalWordCountCenter = cell.wordCountView.center
        var sizeMultiplier = indexPath.item
        if sizeMultiplier > 20 {
            sizeMultiplier = 20
        }
        cell.wordCountView.frame.size = CGSize(width: 1 * sizeMultiplier + 10, height: 1 * sizeMultiplier + 10)
        
        cell.wordCountView.center = originalWordCountCenter
        
        cell.wordCountView.layer.cornerRadius = cell.wordCountView.frame.size.width / 2
        cell.entriesCountView.layer.cornerRadius = cell.entriesCountView.frame.size.width / 2
        
        
        return cell
    }
    
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected cell in column \(indexPath.item)")
    }

    

}

class Entry: NSObject {
    var text: String = ""
    var wordCount: Int = 0
    var date: NSDate = NSDate() // Today's date
    // var user: PFUser = PFUser()
}




