//
//  ButtonStackItem.swift
//  testRecorder
//
//  Created by mac on 21/01/2022.
//

import Foundation

class ButtonStackItem {
    var title:String
    var image: String
    var isSelected: Bool
    
    init(title: String,image: String, isSelected: Bool = false) {
        self.title = title
        self.image = image
        self.isSelected = isSelected
    }
}
