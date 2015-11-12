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
            let randomColor = SKColor(red: CGFloat(arc4random_uniform(255))/CGFloat(255.0),
                green: CGFloat(arc4random_uniform(255))/CGFloat(255.0),
                blue:  CGFloat(arc4random_uniform(255))/CGFloat(255.0),
                alpha: 1.0)
            let tileShape:SKShapeNode = SKShapeNode(path: path)
            tileShape.fillColor = randomColor
            self.addChild(tileShape)
        }
        
//        var i: Int = 0
//        for (coordinate,_) in map.tiles {
//            i+=1
//            let myLabel = SKLabelNode(fontNamed:"Arial")
//            myLabel.text = String(coordinate.x) + ", " +  String(coordinate.y);
//            myLabel.fontSize = 12;
//            myLabel.position = CGPoint(x:10, y: 20*i);
//            self.addChild(myLabel)
//        }
        
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
