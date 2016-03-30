//
//  GameOverScene.swift
//  SpriteKitSimpleGame
//
//  Created by Jorell Linsangan on 2016-03-29.
//  Copyright © 2016 Jorell Linsangan. All rights reserved.
//

import Foundation
import SpriteKit

class GameOverScene: SKScene {
    
    init(size: CGSize, won: Bool, monstersDestroyed: Int) {
        
        super.init(size:size)
        
        backgroundColor = SKColor.whiteColor()
        
        let message = won ? "You Won! \n" : "You Lost. \n"
        
        let label = SKLabelNode(fontNamed: "Chalkduster")
        label.text = message + "You killed \(monstersDestroyed) monsters!"
        label.fontSize = 25
        label.fontColor = SKColor.blackColor()
        label.position = CGPoint(x: size.width/2, y: size.height/2)
        addChild(label)
        
        runAction(SKAction.sequence([
            SKAction.waitForDuration(3.0),
            SKAction.runBlock() {
                
                let reveal = SKTransition.flipHorizontalWithDuration(0.5)
                let scene = GameScene(size: size)
                self.view?.presentScene(scene, transition: reveal)
            }
        ]))
    }
        required init(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}