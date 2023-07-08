//
//  Enums.swift
//  PropertyWrapper
//
//  Created by Ganesh on 08/07/23.
//

import Foundation
import UIKit

enum Assets{
    @ImageAsset("menu_icon") static var menuIcon:UIImage
    @ImageAsset("search_icon") static var searchIcon:UIImage
    @ImageAsset("setting_icon") static var settingIcon:UIImage
    @ImageAsset("plus_icon") static var plusIcon:UIImage
}

enum Colors{
    
    ///without property wrapper
    static var mainRed:UIColor{
        UITraitCollection.current.userInterfaceStyle == .dark ? UIColor.red : UIColor.black
    }
    
    ///with property wrapper
    @Color(light: .red, dark: .black) static var mainRed2
}


