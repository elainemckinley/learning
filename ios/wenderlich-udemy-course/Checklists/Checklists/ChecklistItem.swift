//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Austin McKinley on 10/22/17.
//  Copyright © 2017 Austin McKinley. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject {
    var text = ""
    var checked = false
    
    init(text: String, checked: Bool) {
        self.text = text
        self.checked = checked
    }
    
    func toggleChecked() {
        checked = !checked
    }
}
