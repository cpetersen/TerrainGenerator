//
//  GameScene.swift
//  Algo
//
//  Created by Christopher Petersen on 10/31/15.
//  Copyright (c) 2015 nestedset. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        let midPoint = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        /* Setup your scene here */
        let map = Map(radius: 10)
        for path in map.paths(midPoint) {
            let tileShape:SKShapeNode = SKShapeNode(path: path)
            self.addChild(tileShape)
        }
        
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World! " + String(map.tiles.count);
        myLabel.fontSize = 45;
        myLabel.position = midPoint;
        
        self.addChild(myLabel)

//        let coordinate = Coordinate(x: 0, y: 0)
//        let tile = Tile(coordinate: coordinate)
//        let myNode:SKShapeNode = SKShapeNode(path: tile.path(CGPoint(x:300.0, y:300.0)))
//
//        self.addChild(myNode)
    }
    
//    override func mouseDown(theEvent: NSEvent) {
//        let location = theEvent.locationInNode(self)
//        
//    //        let sprite = SKSpriteNode(imageNamed:"Spaceship")
//    //        sprite.position = location;
//    //        sprite.setScale(0.5)
//    //        
//    //        let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
//    //        sprite.runAction(SKAction.repeatActionForever(action))
//    //        self.addChild(sprite)
//
//        let coordinate = Coordinate(x: 0, y: 0)
//        let tile = Tile(coordinate: coordinate)
//        let myNode:SKShapeNode = SKShapeNode(path: tile.path(location))
//
//        self.addChild(myNode)
//    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
