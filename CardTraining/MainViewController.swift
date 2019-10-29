//
//  MainViewController.swift
//  CardTraining
//
//  Created by brq on 27/06/2019.
//  Copyright © 2019 brq. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController {    
    
    enum cardType {
        case HUB
        case egibility
    }
    
    let card : cardType = .HUB
    var cardView : CardView?
    var button = UIButton()
    let dict: [String: String] = ["Categoria":"Educação","Validade":"31/08/2019"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateCard()
        setupUI()
        constrains()
        
        title = "Mimos"
    }
}


extension MainViewController {
    
    func setupUI(){
        guard let cardView = cardView else {return}
        view.backgroundColor = .black
        view.addSubview(button)
        view.addSubview(cardView)

        button.setTitle("Categorias", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        
        cardView.layer.cornerRadius = 8
        cardView.clipsToBounds = true

    }
    
    func constrains(){
        cardView?.anchor(
            top: (view.layoutMarginsGuide.topAnchor, 25),
            left: (view.leftAnchor, 24),
            right: (view.rightAnchor, 24),
            bottom:(button.topAnchor, 4)
        )
        
        button.anchor(
            left: (view.leftAnchor, 24),
            right: (view.rightAnchor, 24),
            bottom: (view.bottomAnchor, 15),
            height: 60
        )
    }
    
    func populateCard(){
        guard let image = UIImage(named: "CNA") else { return }
        let mimo = Mimos(title: "10", subtitle: "15", image: image , promotion: "9", valid: "MMMMMMMMMMMMMMM", dict: dict)
        if card == .HUB{
            cardView = CardTableView()
            cardView?.constrainUI()
        }else{
            cardView = CardView()
            cardView?.constrainUI()
        }
        cardView?.configure(mimo: mimo)
    }
}


