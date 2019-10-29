//
//  CardView.swift
//  CardTraining
//
//  Created by brq on 27/06/2019.
//  Copyright © 2019 brq. All rights reserved.
//

import UIKit
import RxSwift

 class CardTableView: CardView {
    
    let disposeBag = DisposeBag()
    var tableView = UITableView()
    var items = BehaviorSubject(value: Mimos().dict)
    
    override init(frame:CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func configure(mimo:Mimos){
        
        backgroundColor = UIColor(red:0, green:1, blue:0.37, alpha:1)
        
        titleCard.text = mimo.title
        titleCard.contentMode = .center
        titleCard.numberOfLines = 0
        titleCard.textAlignment = .center
        titleCard.font = UIFont.boldSystemFont(ofSize: 24)
        
        self.subtitleCard.text = mimo.subtitle
        subtitleCard.numberOfLines = 0
        subtitleCard.textAlignment = .center
        subtitleCard.font = UIFont.italicSystemFont(ofSize: 16)
        
        //imageView.image = mimo.image
        //imageView.contentMode = .scaleAspectFit
        
        promotion.text = mimo.promotion
        promotion.numberOfLines = 0
        promotion.textAlignment = .center
        promotion.font = UIFont.boldSystemFont(ofSize: 24)
        
        validLabel .text = mimo.valid
        validLabel.numberOfLines = 0
        validLabel.textAlignment = .center
        validLabel.font = UIFont.italicSystemFont(ofSize: 16)
        
        tableView.isScrollEnabled = false
        tableView.allowsSelection = false
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        tableView.register(CardTableViewCell.self, forCellReuseIdentifier: "cardCell")
        
        items.onNext(mimo.dict)
        bindUI()
    }
    
    override func constrainUI(){
        
        addSubview(titleCard)
        addSubview(subtitleCard)
        container.addSubview(imageView)
        addSubview(promotion)
        addSubview(validLabel)
        addSubview(container)
        addSubview(tableView)
        
        titleCard.anchor(
            top: (topAnchor, 42),
            left: (leftAnchor, 32),
            right: (rightAnchor, 32)
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
            centerX: (container.centerXAnchor, 0),
            centerY: (container.centerYAnchor, 0)
        )
        
        promotion.anchor(
            left: (leftAnchor, 30),
            right: (rightAnchor, 30)
        )
        
        validLabel.anchor(
            top: (promotion.bottomAnchor, 15),
            left: (leftAnchor, 30),
            right: (rightAnchor, 30),
            bottom: (tableView.topAnchor, 36)
        )
        
        tableView.anchor(
            left: (leftAnchor, 0),
            right: (rightAnchor, 0),
            bottom: (bottomAnchor, 0),
            height: 112
        )
    }
    
    func bindUI(){
        tableView.rowHeight = 56
        items.bind(to: tableView.rx.items(cellIdentifier: "cardCell", cellType: CardTableViewCell.self)){
            index, data, cell in
            let cell = cell
            cell.configure(title: data.key, subtitle: data.value)
            cell.constrainUI()
            }.disposed(by:disposeBag)
    }
}
