//
//  MimoModel.swift
//  CardTraining
//
//  Created by brq on 05/07/2019.
//  Copyright © 2019 brq. All rights reserved.
//

import Foundation
import UIKit
public struct Mimos{
    
    var title : String = ""
    var subtitle : String = ""
    var image = UIImage()
    var promotion : String = ""
    var valid : String = ""
    var dict : [String:String] = [:]
    
    init() {}
    
    init(title: String, subtitle: String, image: UIImage, promotion: String, valid: String, dict: [String:String]) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.promotion = promotion
        self.valid = valid
        self.dict = dict
    }
}
