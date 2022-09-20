//
//  ViewController.swift
//  CatGame
//
//  Created by  aleksandr on 12.09.22.
//

import UIKit

class ViewController: UIViewController {
    
    var coordinateX = 150
    var coordinateY = 250
    var myCircleWidth = 100
    var myCircleHeight = 100
    var colors : [UIColor] = [.red, .green, .yellow, .blue, .white]
    var color : UIColor = .white
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemIndigo
        
        let myCircle = UIView(frame:
                                CGRect(x: coordinateX, y: coordinateY,
                                width: myCircleWidth, height: myCircleHeight))
        
        view.addSubview(myCircle)
        myCircle.backgroundColor = color
        myCircle.layer.cornerRadius = 50
        myCircle.layer.borderWidth = 1
        myCircle.layer.shadowOffset = CGSize(width: 0, height: 0)
        myCircle.layer.shadowOpacity = 1
        myCircle.tag = 100
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(gestureFunc))
        myCircle.addGestureRecognizer(gesture)
    }
    @objc func gestureFunc() {
        
        coordinateX = Int.random(in: 0..<(Int(view.frame.size.width) - 100))
        coordinateY = Int.random(in: 60..<(Int(view.frame.size.height) - 100))
        
        let colorIndex = Int.random(in: 0..<(colors.count))
        color = colors[colorIndex]
        if let viewWithTag = self.view.viewWithTag(100) {
            viewWithTag.removeFromSuperview()
        }
        viewDidLoad()
    }
    
}

