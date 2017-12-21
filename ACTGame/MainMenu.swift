//
//  MainMenu.swift
//  ACTGame
//
//  Created by Alex Nagy on 21/12/2017.
//  Copyright © 2017 Alex Nagy. All rights reserved.
//

import SpriteKit

class MainMenu: SKScene {
  
  lazy var playButton: BDButton = {
    var button = BDButton(imageNamed: "ButtonPlay", buttonAction: {
      
      let chance = CGFloat.random(1, max: 10)
      if chance <= 5 {
        //self.showAds()
      } else {
        self.startGameplay()
      }
      
    })
    button.zPosition = 1
    return button
  }()
  
  override func didMove(to view: SKView) {
    setupNodes()
    addNodes()
  }
  
  func setupNodes() {
    
  }
  
  func addNodes() {
    
  }
  
  @objc func startGameplayNotification(_ info:Notification) {
    startGameplay()
  }
  
  func startGameplay() {
    ACTManager.shared.transition(self, toScene: .Gameplay, transition: SKTransition.moveIn(with: .right, duration: 0.5))
    
  }
  
}
