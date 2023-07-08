//
//  PropertyWrappers.swift
//  PropertyWrapper
//
//  Created by Ganesh on 08/07/23.
//

import Foundation
import UIKit

@propertyWrapper
struct Capitalized{
    
    private var value:String = ""
    
    var wrappedValue:String{
        get{
            return value
        }
        
        set{
            value = newValue.capitalized
        }
    }
    
    init(wrappedValue:String) {
        self.wrappedValue = wrappedValue
    }
    
    var projectedValue:Capitalized{
        return self
    }
}


@propertyWrapper
struct PlainUserDefaultsBacked<T>{
    let key:String
    let defaultValue:T
    var storage:UserDefaults = .standard
    
    var wrappedValue:T{
        get{
            let value = storage.value(forKey: key) as? T
            return value ?? defaultValue
        }
        
        set{
            storage.set(newValue, forKey: key)
        }
    }
}

@propertyWrapper
struct CodableUserDefaultsBacked<T:Codable>{
    let key:String
    let defaultValue:T
    var storage:UserDefaults = .standard
    
    var wrappedValue:T{
        get{
            guard let data = storage.value(forKey: key) as? Data,let value = try? JSONDecoder().decode(T.self, from: data) else {
                return defaultValue
            }
            return value
        }
        
        set{
            let data = try? JSONEncoder().encode(newValue)
            storage.set(data, forKey: key)
        }
    }
}

@propertyWrapper
struct ImageAsset{
    let key:String
    init(_ key: String) {
        self.key = key
    }
    
    func image(of name:String) -> UIImage{
        UIImage(named: name) ?? .init()
    }
    
    var projectedValue:String{
        return key
    }
    
    var wrappedValue:UIImage{
        self.image(of: key)
    }
}

@propertyWrapper
struct Color{
    var light:UIColor
    var dark:UIColor
    
    var isDark:Bool{
        UITraitCollection.current.userInterfaceStyle == .dark
    }
    
    var projectedValue:Color{
        return self
    }
    
    var wrappedValue:UIColor{
        if isDark{
            return dark
        }else{
            return light
        }
    }
}
