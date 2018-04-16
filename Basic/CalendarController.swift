//
//  CalendarController.swift
//  Basic
//
//  Created by August Posner on 2018-04-16.
//  Copyright © 2018 Ria Buhlin. All rights reserved.
//

import UIKit

class CalendarController: UIViewController {
    
    let date = Date()
    let calendar = Calendar.current
    
    @IBOutlet weak var dayCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = getTitle()
        
        /*
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        let weekday = calendar.component(.weekday, from: date)
        let firstWeekDay = 8 - calendar.minimumDaysInFirstWeek
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getTitle() -> String {
        let year = getDateUnit(.year)
        let month = Months(rawValue: getDateUnit(.month))
        return "\(String(describing: month)) \(year)"
    }
    
    enum Months: Int {
        case January = 1, February, March, April, May, June, July, August, September, October, November, December
    }
    
    func getDateUnit(_ unit: Calendar.Component) -> Int {
        return calendar.component(unit, from: date)
    }
    
    func getFirstWeekDay() -> Int {
        return 8 - calendar.minimumDaysInFirstWeek
    }
    func getDaysInMonth() -> Int {
        return calendar.range(of: .day, in: .month, for: date)!.count
    }
    
    func setupDayCollection() {
        let cells = dayCollection.visibleCells
        for day in 1...35 {
            if day > getFirstWeekDay() && day < getDaysInMonth() {
                let cell = cells[day]
                let title = UILabel(frame: CGRect(x: 0, y: 0, width: cell.bounds.size.width, height: cell.bounds.height/2))
                title.textColor = UIColor.black
                title.text = "\(day)"
                title.textAlignment = .center
                cell.contentView.addSubview(title)
            }
        }
    }
}
