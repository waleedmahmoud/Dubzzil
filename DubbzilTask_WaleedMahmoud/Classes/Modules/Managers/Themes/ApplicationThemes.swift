//
//  ApplicationThemes.swift
//  DubbzilTask_WaleedMahmoud
//
//  Created by Waleed on 21/11/2020.
//  Copyright © 2020 Waleed. All rights reserved.
//

import UIKit

protocol NavigationBarThemeProperties {
    var navigationBarTintColor: UIColor {set get}
    var navigationBarTitleAttributedFont: [NSAttributedString.Key : Any]? { get set }
}

protocol NavigationBarThemeApplicable {
    static func apply()
}

final class RedTheme: NavigationBarThemeProperties {
    
    var navigationBarTintColor: UIColor
    var navigationBarTitleAttributedFont: [NSAttributedString.Key : Any]?
    
    init(navigationBarTintColor: UIColor, navigationBarTitleAttributedFont: [NSAttributedString.Key : Any]?) {
        self.navigationBarTintColor = navigationBarTintColor
        self.navigationBarTitleAttributedFont = navigationBarTitleAttributedFont
    }
    
}

extension RedTheme: NavigationBarThemeApplicable {
    class func apply() {
        UINavigationBar.appearance().barTintColor = .red
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "American Typewriter", size: 20.0)!]
    }
    
    
}
