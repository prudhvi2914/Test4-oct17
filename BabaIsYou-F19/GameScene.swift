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
    var wall:SKSpriteNode!
    var isblock:SKSpriteNode!
    var flag:SKSpriteNode!

    
    var wallIs = false
    var stopIs = false
    var flagIs = false
    var winIs = false

    
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        //MARK: make the player default walk through walls
         self.player = self.childNode(withName: "baba") as? SKSpriteNode
        
        self.winblock = self.childNode(withName: "winblock") as? SKSpriteNode

        self.stopblock = self.childNode(withName: "stopblock") as? SKSpriteNode

        self.flagblock = self.childNode(withName: "flagblock") as? SKSpriteNode

        self.wallblock = self.childNode(withName: "wallblock") as? SKSpriteNode
         self.wall = self.childNode(withName: "wall") as? SKSpriteNode
        self.isblock = self.childNode(withName: "isblock") as? SKSpriteNode
        self.flag = self.childNode(withName: "flag") as? SKSpriteNode

        
    }
   
    func didBegin(_ contact: SKPhysicsContact) {
        let nodeA = contact.bodyA.node
        let nodeB = contact.bodyB.node
        print("NODE A: \(nodeA!.name)")
        print("NODE B: \(nodeB!.name)")
        
               
        if (nodeA == nil || nodeB == nil) {
            return
        }
        



        
       //GAME LOGIC
//        if (nodeA!.name == "player" && nodeB!.name == "flag") {
//                             print("YOU WIN@!!!!")
//
//                    }
//
//
//       if (nodeA!.name == "flag" && nodeB!.name == "player") {
//                        print("YOU WIN@!!!!")
//                    }
        
        
        
        
//        //implementing wall is stop
//
//        if (nodeA!.name == "wallblock" && nodeB!.name == "isblock") {
////            print("wall is stop")
//            wallIs = true
//         }
//        if (nodeA!.name == "isblock" && nodeB!.name == "wallblock") {
////            print("OTHER wall is stop")
//            wallIs = true
//            print("\(wallIs)")
//         }
//        if(wallIs && (nodeA!.name == "stopblock" && nodeB!.name == "isblock")) {
//          print("OTHER STOP is stop")
//          stopIs = true
//          print("secondmessage BABABABA:\(stopIs)")
//          print("WALL ISSSSS: \(wallIs)")
//            makeWallStop()
//          }
////        else{
////            makePlayerWalkThroughWalls()
////
////        }
//        if  (wallIs && (nodeA!.name == "isblock" && nodeB!.name == "stopblock")) {
//          print("OTHER STOP is stop")
//          stopIs = true
//          print("secondmessage:\(stopIs)")
//          print("WALL ISSSSS: \(wallIs)")
//            makeWallStop()
//
//       }
////            else{
////            makePlayerWalkThroughWalls()
////
////        }
        
        //FLAG IS STOP
        if (nodeA!.name == "flagblock" && nodeB!.name == "isblock") {
                      print("1")
                       flagIs = true
                    }
                   if (nodeA!.name == "isblock" && nodeB!.name == "flagblock") {
                       print("2")
                       flagIs = true
                    }
                   if(flagIs && (nodeA!.name == "stopblock" && nodeB!.name == "isblock")) {
                     print("You won")
                     winIs = true
                     print("one:\(flagIs)")
                     print("WALL ISSSSS: \(winIs)")
                    
                    
                    self.flag.physicsBody = SKPhysicsBody(rectangleOf: flag.size)
                    self.flag.physicsBody?.affectedByGravity = false
                    self.flag.physicsBody?.categoryBitMask = 1
                    self.player.physicsBody?.collisionBitMask = 14
                    
                    
                    
                    
                     }

                   if  (flagIs && (nodeA!.name == "isblock" && nodeB!.name == "stopblock")) {
                     print("OTHER STOP is stop")
                     stopIs = true
                     print("secondmessage:\(stopIs)")
                     print("WALL ISSSSS: \(winIs)")

                   }
        
        
        
        
        
//          if (nodeA!.name == "flagblock" && nodeB!.name == "isblock") {
//               print("1")
//                flagIs = true
//             }
//            if (nodeA!.name == "isblock" && nodeB!.name == "flagblock") {
//                print("2")
//                flagIs = true
//             }
//            if(flagIs && (nodeA!.name == "winblock" && nodeB!.name == "isblock")) {
//              print("You won")
//              winIs = true
//              print("one:\(flagIs)")
//              print("WALL ISSSSS: \(winIs)")
//              }
//
//            if  (flagIs && (nodeA!.name == "isblock" && nodeB!.name == "winblock")) {
//              print("OTHER STOP is stop")
//              stopIs = true
//              print("secondmessage:\(stopIs)")
//              print("WALL ISSSSS: \(winIs)")
//
//            }
       
        
        
        
                      
//            //implementing wall is Win
//           if (nodeA!.name == "wallblock" && nodeB!.name == "isblock") {
//                  if(nodeA!.name == "isblock" && nodeB!.name == "winblock"){
//                                     print("wall is win")
//                      //if player touches the the wall wins the game
//                  if (nodeA!.name == "player" && nodeB!.name == "wall") {
//                                        print("YOU WIN@!!!!")
//                    }
//
//            }}
//            if (nodeA!.name == "isblock" && nodeB!.name == "wallblock") {
//                            if(nodeA!.name == "winblock" && nodeB!.name == "isblock"){
//                                               print("wall is win")
//                                //if player touches the the wall wins the game
//                            if (nodeA!.name == "player" && nodeB!.name == "wall") {
//                                                  print("YOU WIN@!!!!")
//                              }
//
//                }}
//                //implementing falg is WIN
//            if (nodeA!.name == "flagblock" && nodeB!.name == "isblock") {
//                                 if(nodeA!.name == "isblock" && nodeB!.name == "winblock"){
//                                                    print("wall is win")
//                                     //if player touches the the wall wins the game
//                                 if (nodeA!.name == "player" && nodeB!.name == "wall") {
//                                                       print("YOU WIN@!!!!")
//                                   }
//
//                }}
//             if (nodeA!.name == "isblock" && nodeB!.name == "flagblock") {
//                                           if(nodeA!.name == "stopblock" && nodeB!.name == "isblock"){
//                                                              print("wall is win")
//                                               //if player touches the the wall wins the game
//                                           if (nodeA!.name == "player" && nodeB!.name == "wall") {
//                                                                 print("YOU WIN@!!!!")
//                                             }
//
//                                       }
////
////
               }
    

        
    func makeWallStop(){
                self.wall.physicsBody = SKPhysicsBody(rectangleOf: wall.size)
                self.player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
                self.wall.physicsBody?.affectedByGravity = false
                self.player.physicsBody?.affectedByGravity = false
                self.wall.physicsBody?.categoryBitMask = 16
                self.player.physicsBody?.categoryBitMask = 1

                self.wall.physicsBody?.collisionBitMask = 0
                self.player.physicsBody?.collisionBitMask = 30
    }
    func makePlayerWalkThroughWalls(){
        self.player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        self.player.physicsBody?.affectedByGravity = false
        self.player.physicsBody?.categoryBitMask = 1
        self.player.physicsBody?.collisionBitMask = 14
        
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
                

}
