//
//  String+Extension.swift
//  DubbzilTask_WaleedMahmoud
//
//  Created by Waleed on 21/11/2020.
//  Copyright © 2020 Waleed. All rights reserved.
//

import Foundation

extension String {
    func getDateFromTimeStamp() -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"

        if let date: Date = dateFormatterGet.date(from: self) {
            return dateFormatterPrint.string(from: date)
        }
        return ""
    }
}
