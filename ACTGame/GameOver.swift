//
//  GameOver.swift
//  ACTGame
//
//  Created by Alex Nagy on 21/12/2017.
//  Copyright © 2017 Alex Nagy. All rights reserved.
//

import SpriteKit

class GameOver: SKScene {
  
  var background: SKSpriteNode = {
    var sprite = SKSpriteNode(imageNamed: "Background")
    if DeviceType.isiPad || DeviceType.isiPadPro {
      sprite.scaleTo(screenWidthPercentage: 1.0)
    } else {
      sprite.scaleTo(screenHeightPercentage: 1.0)
    }
    sprite.zPosition = 0
    return sprite
  }()
  
  var title: SKLabelNode = {
    var label = SKLabelNode(fontNamed: "GlutenFT-Regular")
    label.fontSize = CGFloat.universalFont(size: 28)
    label.zPosition = 2
    label.color = SKColor.white
    label.horizontalAlignmentMode = .center
    label.verticalAlignmentMode = .center
    label.text = "Game Over"
    return label
  }()
  
  var score: SKLabelNode = {
    var label = SKLabelNode(fontNamed: "GlutenFT-Regular")
    label.fontSize = CGFloat.universalFont(size: 24)
    label.zPosition = 2
    label.color = SKColor.white
    label.horizontalAlignmentMode = .center
    label.verticalAlignmentMode = .center
    label.text = "Score: 00"
    return label
  }()
  
  var bestScore: SKLabelNode = {
    var label = SKLabelNode(fontNamed: "GlutenFT-Regular")
    label.fontSize = CGFloat.universalFont(size: 24)
    label.zPosition = 2
    label.color = SKColor.white
    label.horizontalAlignmentMode = .center
    label.verticalAlignmentMode = .center
    label.text = "Best Score: 00"
    return label
  }()
  
  lazy var backButton: BDButton = {
    var button = BDButton(imageNamed: "ButtonBack", title: "", buttonAction: {
      ACTManager.shared.transition(self, toScene: .MainMenu, transition: SKTransition.moveIn(with: .left, duration: 0.5))
    })
    button.zPosition = 1
    button.scaleTo(screenWithPercentage: 0.15)
    return button
  }()
  
  lazy var replayButton: BDButton = {
    var button = BDButton(imageNamed: "ButtonReplay", buttonAction: {
      
      
      
    })
    button.scaleTo(screenWithPercentage: 0.27)
    button.zPosition = 1
    return button
  }()
  
  override func didMove(to view: SKView) {
    anchorPoint = CGPoint(x: 0.5, y: 0.5)
    setupNodes()
    addNodes()
  }
  
  func setupNodes() {
    background.position = CGPoint.zero
    title.position = CGPoint(x: ScreenSize.width * 0.0, y: ScreenSize.heigth * 0.25)
    score.position = CGPoint(x: ScreenSize.width * 0.0, y: ScreenSize.heigth * 0.12)
    bestScore.position = CGPoint(x: ScreenSize.width * 0.0, y: ScreenSize.heigth * 0.08)
    backButton.position = CGPoint(x: ScreenSize.width * -0.4, y: ScreenSize.heigth * 0.4)
    replayButton.position = CGPoint(x: ScreenSize.width * 0.0, y: ScreenSize.heigth * -0.10)
  }
  
  func addNodes() {
    addChild(background)
    addChild(title)
    addChild(score)
    addChild(bestScore)
    addChild(backButton)
    addChild(replayButton)
  }
  
}




















