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
       let PLAYER_SPEED:CGFloat = 40
    
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
    var playerflag = false
    var flagwinIs = false
    var wallwinIs = false
    var playerwall = false
    
    
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

        // MARK1:implementing wall is stop

        if (nodeA!.name == "wallblock" && nodeB!.name == "isblock") {
//            print("wall is stop")
            wallIs = true
         }
        if (nodeA!.name == "isblock" && nodeB!.name == "wallblock") {
//            print("OTHER wall is stop")
            wallIs = true
            print("\(wallIs)")
         }
        if(wallIs && (nodeA!.name == "stopblock" && nodeB!.name == "isblock")) {
          print("OTHER STOP is stop")
          stopIs = true
          print("secondmessage BABABABA:\(stopIs)")
    
            makeWallStop()
          }
//
        if  (wallIs && (nodeA!.name == "isblock" && nodeB!.name == "stopblock")) {
          print("OTHER STOP is stop")
          stopIs = true
          print("secondmessage:\(stopIs)")
          print("WALL ISSSSS: \(wallIs)")
            makeWallStop()

          }

          //MARK2: Deactivating the Wall is Active rule
        
        if (wallIs && stopIs == false ){
            
            print("Passing through the wall")
            makePlayerWalkThroughWalls()
        }
        
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
                     playerHitsFlag()

                     }

                   if  (flagIs && (nodeA!.name == "isblock" && nodeB!.name == "stopblock")) {
                     print("OTHER STOP is stop")
                     stopIs = true
                     print("secondmessage:\(stopIs)")
                     print("WALL ISSSSS: \(winIs)")
                     playerHitsFlag()
                   }
        ////MARK4: Deactivating the Flag is Stop rule
        
        if (wallIs && stopIs == false ){
            
            print("Passing through the wall")
            makePlayerWalkThroughWalls()
        }
        
    
       
        
        
        
                      
////            //implementing wall is Win
          if (nodeA!.name == "wallblock" && nodeB!.name == "isblock") {
             print("1")
              wallIs = true
           }
          if (nodeA!.name == "isblock" && nodeB!.name == "wallblock") {
              print("2")
              wallIs = true
           }
          if(wallIs && (nodeA!.name == "winblock" && nodeB!.name == "isblock")) {



            self.winblock.physicsBody = SKPhysicsBody(rectangleOf: winblock.size)
            self.winblock.physicsBody?.affectedByGravity = false
            self.winblock.physicsBody?.categoryBitMask = 4
            self.winblock.physicsBody?.collisionBitMask = 4294967295
            self.winblock.physicsBody?.contactTestBitMask = 8




            print("You won")
            wallwinIs = true
            print("one:\(wallIs)")
            print("One Wall: \(flagwinIs)")

            }

          if  (wallIs && (nodeA!.name == "isblock" && nodeB!.name == "winblock")) {
            print("OTHER STOP is stop")
            wallwinIs = true
            print("WALL ISSSSS: \(wallwinIs)")
            self.wall.physicsBody = SKPhysicsBody(rectangleOf: wall.size)
            self.wall.physicsBody?.affectedByGravity = false
            self.wall.physicsBody?.categoryBitMask = 16
            self.wall.physicsBody?.collisionBitMask = 0
            self.wall.physicsBody?.contactTestBitMask = 0
            self.player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
                      self.player.physicsBody?.affectedByGravity = false
                      self.player.physicsBody?.categoryBitMask = 1
                      self.player.physicsBody?.collisionBitMask = 16
                      self.player.physicsBody?.contactTestBitMask = 16

      }
        if(nodeA!.name == "player" && nodeB!.name == "wall"){
        playerwall = true
            wallwinIs = true
        }
        if(nodeA!.name == "wall" && nodeB!.name == "player"){
            playerwall = true
            wallwinIs = true


        }
        if (wallwinIs && playerwall == true ){
            print("Yahooo")
            showWinScreen()

        }
    
     


                //implementing falg is WIN
            if (nodeA!.name == "flagblock" && nodeB!.name == "isblock") {
               print("1")
                flagIs = true
             }
            if (nodeA!.name == "isblock" && nodeB!.name == "flagblock") {
                print("2")
                flagIs = true
             }
            if(flagIs && (nodeA!.name == "winblock" && nodeB!.name == "isblock")) {
              print("You won")
              flagwinIs = true
              print("one:\(flagIs)")
              print("One Wall: \(flagwinIs)")

              }

            if  (flagIs && (nodeA!.name == "isblock" && nodeB!.name == "winblock")) {
              print("OTHER STOP is stop")
              flagwinIs = true
              print("secondmessage:\(flagwinIs)")
              print("WALL ISSSSS: \(winIs)")

        }
        if (flagwinIs && (nodeA!.name == "player" && nodeB!.name == "flag") ){
                                  print("YOU WIN@!!!!")
                 playerHitsFlag()
                 showWinScreen()

                         }


            if (flagwinIs && (nodeA!.name == "flag" && nodeB!.name == "player")) {
                             print("YOU win!!!!")
                playerHitsFlag()
                 showWinScreen()

        }
       

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
    func playerHitsFlag(){
        
           self.flag.physicsBody = SKPhysicsBody(rectangleOf: flag.size)
           self.flag.physicsBody?.affectedByGravity = false
           self.flag.physicsBody?.categoryBitMask = 1
           self.player.physicsBody?.collisionBitMask = 46
        
    }
    func showWinScreen(){
        if let scene = SKScene(fileNamed: "Win") {
                     scene.scaleMode = .aspectFill
                     // OPTION 1: Change screens with an animation
            self.view?.presentScene(scene, transition: SKTransition.flipVertical(withDuration: 2.5))}
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
