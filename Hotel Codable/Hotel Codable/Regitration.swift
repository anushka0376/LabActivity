//
//  Regitration.swift
//  Hotel Codable
//
//  Created by Anushka Bhatnagar on 27/08/25.
//

import Foundation

struct Regitration{
    var firstName: String
    var lastName: String
    var emailAddress: String
    
    var checkInDate: Date
    var checkOutDate: Date
    var numberOfAdults: Int
    var numberOfChildren: Int
    
    var wifi: Bool
    var roomType: RoomType
}

