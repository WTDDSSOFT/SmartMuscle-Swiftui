//
//  User.swift
//  SmartMuscle
//
//  Created by william torres dias dos santos on 07/06/23.
//

import Foundation

struct FullName: CustomStringConvertible {
    var name: String
    var description: String {
        return "\(name)"
    }
}


func convertToCarInformation(carString: String) -> FullName? {
    let carInformationArray = carString.split(separator: " ")
    if carInformationArray.count == 1 {
        return FullName(name: String(carInformationArray[0]))
    } else {
        return nil;
    }
}
