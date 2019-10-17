//
//  GameScene.swift
//  BabaIsYou-F19
//
//  Created by Parrot on 2019-10-17.
//  Copyright © 2019 Parrot. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {

    // MARK: Outlets for sprites
       var player:SKSpriteNode!
       let PLAYER_SPEED:CGFloat = 20
    
    var winblock:SKSpriteNode!
     var stopblock:SKSpriteNode!
     var flagblock:SKSpriteNode!
    var wallblock:SKSpriteNode!
    
    

    
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
         self.player = self.childNode(withName: "baba") as! SKSpriteNode
        self.winblock = self.childNode(withName: "winblock") as! SKSpriteNode

        self.stopblock = self.childNode(withName: "stopblock") as? SKSpriteNode

        self.flagblock = self.childNode(withName: "flagblock") as! SKSpriteNode

        self.wallblock = self.childNode(withName: "wallblock") as? SKSpriteNode

        
    }
   
    func didBegin(_ contact: SKPhysicsContact) {
        print("Something collided!")
        let nodeA = contact.bodyA.node
               let nodeB = contact.bodyB.node
               
               if (nodeA == nil || nodeB == nil) {
                   return
               }
        
        if (nodeA!.name == "player" && nodeB!.name == "winblock") {
                        print("RESETTING POSITION-AAAA")
               }
        
        
        if (nodeA!.name == "winblock" && nodeB!.name == "player") {
                   print("RESETTING POSITION-BBBBB")
               }
        if (nodeA!.name == "player" && nodeB!.name == "flag") {
                             print("RESETTING POSITION-AAAA")
                    }
             
             
             if (nodeA!.name == "flag" && nodeB!.name == "player") {
                        print("YOU WIN@!!!!")
                    }
        
        
        
        
//              self.ground.physicsBody = SKPhysicsBody(rectangleOf: ground.size)
//              self.ground.physicsBody?.affectedByGravity = false
//              self.ground.physicsBody?.categoryBitMask = 32
//              self.ground.physicsBody?.collisionBitMask = 0
//              self.ground.physicsBody?.contactTestBitMask = 0
        
        
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // GET THE POSITION WHERE THE MOUSE WAS CLICKED
              // ---------------------------------------------
              let mouseTouch = touches.first
              if (mouseTouch == nil) {
                  return
              }
              let location = mouseTouch!.location(in: self)

              // WHAT NODE DID THE PLAYER TOUCH
              // ----------------------------------------------
              let nodeTouched = atPoint(location).name
              //print("Player touched: \(nodeTouched)")
              
              
              // GAME LOGIC: Move player based on touch
              if (nodeTouched == "upButton") {
                  // move up
                  self.player.position.y = self.player.position.y + PLAYER_SPEED
              }
              else if (nodeTouched == "downButton") {
                  // move down
                   self.player.position.y = self.player.position.y - PLAYER_SPEED
              }
              else if (nodeTouched == "leftButton") {
                  // move left
                   self.player.position.x = self.player.position.x - PLAYER_SPEED
              }
              else if (nodeTouched == "rightButton") {
                  // move right
                   self.player.position.x = self.player.position.x + PLAYER_SPEED
              }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
}
