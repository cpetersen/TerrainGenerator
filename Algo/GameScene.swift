//
//  GameScene.swift
//  Algo
//
//  Created by Christopher Petersen on 10/31/15.
//  Copyright (c) 2015 nestedset. All rights reserved.
//

import SpriteKit


class GameScene: SKScene {
    var tileHeight: CGFloat = 32
    var xOffset: CGFloat = 0
    var yOffset: CGFloat = 0

    // let map = Map(radius: 100, terrainGenerator: RandomTerrainGenerator())
    // let map = Map(radius: 100, terrainGenerator: MarkovTerrainGenerator(map: map))
    let map = Map(radius: 50, terrainGenerator: PerlinNoiseTerrainGenerator(height: 100, width: 100, octaves: 5))
    
    override func didMoveToView(view: SKView) {
        let midPoint = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))

        self.map.camera(midPoint, height: tileHeight)
        for (_, tile) in map.tiles {
            self.addChild(tile)
        }
    }

    override func keyDown(theEvent: NSEvent) {
        switch(theEvent.keyCode) {
        case 126: // Up
            yOffset -= tileHeight
            print("Up \(yOffset)")
        case 124: // Right
            xOffset -= tileHeight
            print("Right \(xOffset)")
        case 125: // Down
            yOffset += tileHeight
            print("Down \(yOffset)")
        case 123: // Left
            xOffset += tileHeight
            print("Left \(xOffset)")
        case 24: // Plus
            tileHeight += 2.0
            print("Zoom In \(tileHeight)")
        case 27: // Minus
            tileHeight -= 2.0
            print("Zoom Out \(tileHeight)")
        default:
            true
        }
        let midPoint = CGPoint(x:(CGRectGetMidX(self.frame)+xOffset), y:(CGRectGetMidY(self.frame)+yOffset))
        self.map.camera(midPoint, height: tileHeight)
    }

    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
    }
}
