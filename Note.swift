//
//  Note.swift
//  Notebook
//
//  Created by Colin Smith on 3/8/19.
//  Copyright © 2019 Colin Smith. All rights reserved.
//

import Foundation

class Note: Codable {
    
    var bodyText: String
    let timeStamp = Date()
    
    init(bodyText: String) {
        self.bodyText = bodyText
    }
}


extension Note: Equatable {
    static func == (lhs: Note, rhs: Note) -> Bool {
        return lhs.timeStamp == rhs.timeStamp && lhs.bodyText == rhs.bodyText
    }
}
