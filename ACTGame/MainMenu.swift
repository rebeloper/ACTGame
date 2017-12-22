//
//  MainMenu.swift
//  ACTGame
//
//  Created by Alex Nagy on 21/12/2017.
//  Copyright © 2017 Alex Nagy. All rights reserved.
//

import SpriteKit

class MainMenu: SKScene {
  
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
    label.fontSize = CGFloat.universalFont(size: 24)
    label.zPosition = 2
    label.color = SKColor.white
    label.horizontalAlignmentMode = .center
    label.verticalAlignmentMode = .center
    label.text = "The Biggest Donut"
    return label
  }()
  
  lazy var playButton: BDButton = {
    var button = BDButton(imageNamed: "ButtonPlay", buttonAction: {
      
      let chance = CGFloat.random(1, max: 10)
      if chance <= 5 {
        self.showAds()
      } else {
        self.startGameplay()
      }
      
    })
    button.scaleTo(screenWithPercentage: 0.33)
    button.zPosition = 1
    return button
  }()
  
  lazy var rateButton: BDButton = {
    var button = BDButton(imageNamed: "ButtonRate", buttonAction: {
      
      if let url = URL(string: "https://itunes.apple.com/app/id\(AppId)?action=write-review/") {
        UIApplication.shared.open(url, options: [:], completionHandler: { (result) in
          if result {
            print("Success")
          } else {
            print("Failed")
          }
        })
        
      }
      
    })
    button.scaleTo(screenWithPercentage: 0.27)
    button.zPosition = 1
    return button
  }()
  
  lazy var shareButton: BDButton = {
    var button = BDButton(imageNamed: "ButtonShare", buttonAction: {
      
      ACTManager.shared.share(on: self, text: "I just love this new game. Go ahead and download 'The Biggest Donut' from the App Store", image: UIImage(named: "Donut92"), exculdeActivityTypes: [])
      
    })
    button.scaleTo(screenWithPercentage: 0.27)
    button.zPosition = 1
    return button
  }()
  
  override func didMove(to view: SKView) {
    anchorPoint = CGPoint(x: 0.5, y: 0.5)
    setupNodes()
    addNodes()
    
    NotificationCenter.default.addObserver(self, selector: #selector(self.startGameplayNotification(_:)), name: startGameplayNotificationName, object: nil)
  }
  
  func setupNodes() {
    background.position = CGPoint.zero
    title.position = CGPoint(x: ScreenSize.width * 0.0, y: ScreenSize.heigth * 0.25)
    playButton.position = CGPoint.zero
    playButton.logAvailableFonts()
    rateButton.position = CGPoint(x: ScreenSize.width * -0.20, y: ScreenSize.heigth * -0.15)
    shareButton.position = CGPoint(x: ScreenSize.width * 0.20, y: ScreenSize.heigth * -0.15)
  }
  
  func addNodes() {
    addChild(background)
    addChild(title)
    addChild(playButton)
    addChild(rateButton)
    addChild(shareButton)
  }
  
  @objc func startGameplayNotification(_ info:Notification) {
    startGameplay()
  }
  
  func startGameplay() {
    ACTManager.shared.transition(self, toScene: .Gameplay, transition: SKTransition.moveIn(with: .right, duration: 0.5))
    
  }
  
  func showAds() {
    if !ACTPlayerStats.shared.getNoAds() {
      if !Chartboost.hasInterstitial(CBLocationMainMenu) {
        Chartboost.cacheInterstitial(CBLocationMainMenu)
        startGameplay()
      } else {
        Chartboost.showInterstitial(CBLocationMainMenu)
        Chartboost.cacheInterstitial(CBLocationMainMenu)
      }
    } else {
      startGameplay()
    }
  }
  
}
