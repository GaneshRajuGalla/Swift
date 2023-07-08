//
//  NonPropertyWrapper.swift
//  PropertyWrapper
//
//  Created by Ganesh on 08/07/23.
//

import Foundation

struct CapitalizedWrapper{
    private var _value:String
    
    var value:String{
        set{
            _value = newValue.capitalized
        }
        
        get{
            return _value
        }
    }
    
    init(value: String) {
        self._value = value.capitalized
    }
}
