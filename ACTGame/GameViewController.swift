//
//  GameViewController.swift
//  ACTGame
//
//  Created by Alex Nagy on 21/12/2017.
//  Copyright © 2017 Alex Nagy. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
  
  let skView: SKView = {
    let view = SKView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(skView)
    
    skView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    skView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    skView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    skView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    
    let scene = MainMenu(size: CGSize(width: ScreenSize.width, height: ScreenSize.heigth))
    scene.scaleMode = .aspectFill
    skView.presentScene(scene)
    skView.ignoresSiblingOrder = true
    
  }
  
}
