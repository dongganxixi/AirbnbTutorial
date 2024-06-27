//
//  Item.swift
//  AirbnbTutorial
//
//  Created by 胡瑞兴 on 2024/6/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
