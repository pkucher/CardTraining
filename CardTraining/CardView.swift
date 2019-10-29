//
//  CardView.swift
//  CardTraining
//
//  Created by brq on 27/06/2019.
//  Copyright © 2019 brq. All rights reserved.
//

import UIKit

class CardView: UIView {

    var titleCard = UILabel()
    var subtitleCard = UILabel()
    var imageView = UIImageView()
    var promotion = UILabel()
    var validLabel = UILabel()
    var container = UIView()

    
    override init(frame:CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(mimo:Mimos){
        

        backgroundColor = UIColor(red:0, green:1, blue:0.37, alpha:1)


        titleCard.contentMode = .center
        titleCard.text = mimo.title
        titleCard.numberOfLines = 0
        titleCard.textAlignment = .center
        titleCard.font = UIFont.boldSystemFont(ofSize: 24)
        
        subtitleCard.text = mimo.subtitle
        subtitleCard.numberOfLines = 0
        subtitleCard.textAlignment = .center
        subtitleCard.font = UIFont.italicSystemFont(ofSize: 16)

        imageView.image = mimo.image
        imageView.contentMode = .scaleAspectFit

        promotion.text = mimo.promotion
        promotion.numberOfLines = 0
        promotion.textAlignment = .center
        promotion.font = UIFont.boldSystemFont(ofSize: 24)

        validLabel.text = mimo.valid
        validLabel.numberOfLines = 0
        validLabel.textAlignment = .center
        validLabel.font = UIFont.italicSystemFont(ofSize: 16)

    }
    
    func constrainUI(){
        
        addSubview(titleCard)
        addSubview(subtitleCard)
        container.addSubview(imageView)
        addSubview(promotion)
        addSubview(validLabel)
        addSubview(container)
        
        titleCard.anchor(
            top: (topAnchor, 27),
            left: (leftAnchor, 30),
            right: (rightAnchor, 30)
        )
        
        subtitleCard.anchor(
            top: (titleCard.bottomAnchor, 15),
            left: (leftAnchor, 30),
            right: (rightAnchor, 30)
        )
        
        container.anchor(
            top: (subtitleCard.bottomAnchor, 60),
            left: (leftAnchor, 40),
            right: (rightAnchor, 40),
            bottom: (promotion.topAnchor, 44)
        )
        
        imageView.anchor(
            centerX: (centerXAnchor, 0),
            centerY: (centerYAnchor, 0)
        )
        
        promotion.anchor(
            left: (leftAnchor, 30),
            right: (rightAnchor, 30),
            bottom: (validLabel.topAnchor, 15)
        )
        
        validLabel.anchor(
            left: (leftAnchor, 30),
            right: (rightAnchor, 30),
            bottom: (bottomAnchor, 30)
        )
    }
}
