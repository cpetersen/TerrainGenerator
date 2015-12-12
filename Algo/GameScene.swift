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
    //  let terrainGenerator: TerrainGenerator = RandomTerrainGenerator()
    //  let terrainGenerator: TerrainGenerator = MarkovTerrainGenerator(map: map)
    //  let terrainGenerator: TerrainGenerator = PerlinNoiseTerrainGenerator(height: 100, width: 100, octaves: 5)
    let map = Map(radius: 50, terrainGenerator: PerlinNoiseTerrainGenerator(height: 100, width: 100, octaves: 5))
    
    override func didMoveToView(view: SKView) {
//        let start = NSDate()
        let midPoint = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        /* Setup your scene here */

        self.map.camera(midPoint, height: tileHeight)
        // START SPRITES
//        map.center(midPoint)
        for (_, tile) in map.tiles {
            self.addChild(tile)
        }
        // END SPRITES

        // START PATHS
//        for path in map.paths(midPoint) {
//            let randomColor = SKColor(
//                red: CGFloat(arc4random_uniform(255))/CGFloat(255.0),
//                green: CGFloat(arc4random_uniform(255))/CGFloat(255.0),
//                blue:  CGFloat(arc4random_uniform(255))/CGFloat(255.0),
//                alpha: 1.0
//            )
//            let tileShape:SKShapeNode = SKShapeNode(path: path)
//            tileShape.fillColor = randomColor
//            self.addChild(tileShape)
//        }
        // END PATHS

/*
        let tile = map.tile(Coordinate(x: 0, y: 0))!
        let SIZE = CGSize(width: 800, height: 400)
        let png = NSBitmapImageRep(bitmapDataPlanes: nil, pixelsWide: Int(SIZE.width),
            pixelsHigh: Int(SIZE.height), bitsPerSample: 8, samplesPerPixel: 4, hasAlpha: true,
            isPlanar: false, colorSpaceName: NSDeviceRGBColorSpace, bytesPerRow: 0, bitsPerPixel: 0)
        drawHexagonIntoBitmap(png!, path: tile.path(CGPoint(x: 0, y: 0)))
        saveAsPNGWithName("/Users/christopherpetersen/hex.png",bitMap: png!)
*/

//        let end = NSDate()
//        let timeInterval: Double = end.timeIntervalSinceDate(start)
//        print("MAIN: Time to evaluate problem \(timeInterval) seconds")
    }
    
    override func mouseDown(theEvent: NSEvent) {
        print("MOUSE DOWN")
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


    override func scrollWheel(theEvent: NSEvent) {
        //        let location = theEvent.locationInNode(self)
        print("SCROLL")
    }

    override func magnifyWithEvent(theEvent: NSEvent) {
        //        let location = theEvent.locationInNode(self)
        print("MAGNIFY")
    }

    override func smartMagnifyWithEvent(theEvent: NSEvent) {
        //        let location = theEvent.locationInNode(self)
        print("SMART MAGNIFY")
    }

    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
    }

    
/*
    private func saveAsPNGWithName(fileName: String, bitMap: NSBitmapImageRep) -> Bool {
        let props: [String:AnyObject] = [:]
        let imageData = bitMap.representationUsingType(NSBitmapImageFileType.NSPNGFileType, properties: props)
        return imageData!.writeToFile(fileName, atomically: false)
    }

    private func drawHexagonIntoBitmap(bitmap: NSBitmapImageRep, path: CGMutablePathRef) {
        let ctx = NSGraphicsContext(bitmapImageRep: bitmap)
        NSGraphicsContext.setCurrentContext(ctx)
        NSColor(red: 124 / 255, green: 252 / 255, blue: 0, alpha: 1.0).set()
        let color = SKColor(
            red: CGFloat(arc4random_uniform(255))/CGFloat(255.0),
            green: CGFloat(arc4random_uniform(255))/CGFloat(255.0),
            blue:  CGFloat(arc4random_uniform(255))/CGFloat(255.0),
            alpha: 1.0
        )
        let shape:SKShapeNode = SKShapeNode(path: path)
        shape.strokeColor = color
        shape.fillColor = color
    }
*/
}
