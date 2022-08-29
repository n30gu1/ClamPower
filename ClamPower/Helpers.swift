//
//  Helpers.swift
//  ClamPower
//
//  Created by Sung Park on 2022/08/29.
//

import Foundation
import IOKit.ps

func getChargingState() -> Bool {
    let value = IOPSCopyExternalPowerAdapterDetails()
    
    if value != nil {
        return true
    } else {
        return false
    }
}

extension Bool {
    func isSameAsAnotherValue(_ rhs: inout Bool) -> Bool {
        if self == rhs {
            return true
        } else {
            rhs = self
            
            return false
        }
    }
}
