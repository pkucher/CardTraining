//
//  CardTableViewCell.swift
//  CardTraining
//
//  Created by brq on 03/07/2019.
//  Copyright © 2019 brq. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {

    var title = UILabel()
    var response = UILabel()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(title:String, subtitle:String){
        
        self.title.text = title
        self.response.text = subtitle
        
        self.title.textColor = .black
        self.title.font = UIFont.boldSystemFont(ofSize: 12)
        response.font = UIFont.italicSystemFont(ofSize: 12)
        clipsToBounds = true
        
    }
    
    func constrainUI(){
        
        addSubview(title)
        addSubview(response)
        
        title.anchor(
            top: (topAnchor, 10),
            left:  (leftAnchor, 10),
            bottom:(bottomAnchor, 10)
        )
        
        response.anchor(
            top: (topAnchor, 10),
            left:  (title.rightAnchor, 10),
            right: (rightAnchor , 10),
            bottom:(bottomAnchor, 10)
        )
        
    }
}
