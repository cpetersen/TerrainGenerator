//
//  Tile.swift
//  Algo
//
//  Created by Christopher Petersen on 10/31/15.
//  Copyright © 2015 nestedset. All rights reserved.
//

import Foundation
import SpriteKit

class Tile : SKSpriteNode {
  var height: CGFloat = 8
  var width: CGFloat { return (height*(sqrt(3.0)/2.0)) }
  
//  var northOffset: CGPoint { return CGPoint(x: 0, y: (height/2.0)) }
//  var southOffset: CGPoint { return CGPoint(x: 0, y: -(height/2.0)) }
//  var northwestOffset: CGPoint { return CGPoint(x: -(width/2.0), y:  (height/4.0)) }
//  var southwestOffset: CGPoint { return CGPoint(x: -(width/2.0), y: -(height/4.0)) }
//  var northeastOffset: CGPoint { return CGPoint(x:  (width/2.0), y:  (height/4.0)) }
//  var southeastOffset: CGPoint { return CGPoint(x:  (width/2.0), y: -(height/4.0)) }

  let coordinate: Coordinate
  let map: Map
  var type: Int
  // -1 Undefined

  // Water
  // Sand
  // Grass
  // Stone
  // Rock
  // Lava
  // Snow
  
  init(coordinate: Coordinate, map: Map, type: Int) {
//    self.height = 32
    self.coordinate = coordinate
    self.map = map
    self.type = type
    let texture: SKTexture = SKTexture(imageNamed: Tile.spriteName(type))
    super.init(texture: texture, color: NSColor(white: 1, alpha: 1), size: CGSize(width: 83, height: 96))
  }

//  init(coordinate: Coordinate, map: Map, terrainGenerator: TerrainGenerator) {
//    self.coordinate = coordinate
//    self.map = map
//    self.type = -1
////    self.type = terrainGenerator.generate(self)
//    let texture: SKTexture = SKTexture(imageNamed: "water")
//    super.init(texture: texture, color: NSColor(white: 1, alpha: 1), size: CGSize(width: 83, height: 96))
//  }

  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func mapLocation() -> CGPoint {
    let x: CGFloat = width*CGFloat(coordinate.col())+((width/CGFloat(2))*CGFloat(coordinate.row()%2))
    let y: CGFloat = (height * CGFloat(0.75))*CGFloat(coordinate.row())
    return CGPoint(x:x,y:y)
  }

//  func path(offset: CGPoint) -> CGMutablePathRef {
//    let path:CGMutablePathRef = CGPathCreateMutable()
//
//    let offsetX: CGFloat = mapLocation().x + offset.x
//    let offsetY: CGFloat = mapLocation().y + offset.y
//    CGPathMoveToPoint(path, nil, offsetX+northOffset.x, offsetY+northOffset.y)
//    CGPathAddLineToPoint(path, nil, offsetX+northwestOffset.x, offsetY+northwestOffset.y)
//    CGPathAddLineToPoint(path, nil, offsetX+southwestOffset.x, offsetY+southwestOffset.y)
//    CGPathAddLineToPoint(path, nil, offsetX+southOffset.x, offsetY+southOffset.y)
//    CGPathAddLineToPoint(path, nil, offsetX+southeastOffset.x, offsetY+southeastOffset.y)
//    CGPathAddLineToPoint(path, nil, offsetX+northeastOffset.x, offsetY+northeastOffset.y)
//    CGPathAddLineToPoint(path, nil, offsetX+southOffset.x, offsetY+northOffset.y)
//
//    return path
//  }

//  func sprite(offset: CGPoint) -> SKSpriteNode {
//    return sprite(offset, height: self.height)
//  }
//
//  func sprite(offset: CGPoint, height: CGFloat) -> SKSpriteNode {
//    let sprite = SKSpriteNode(imageNamed:spriteName())
////    let sprite = SKSpriteNode()
////    sprite.imageNamed = spriteName
//    let offsetX: CGFloat = mapLocation().x + offset.x
//    let offsetY: CGFloat = mapLocation().y + offset.y
//    sprite.position = CGPoint(x: offsetX, y: offsetY)
//    sprite.setScale(CGFloat(height)/CGFloat(sprite.size.height-1))
//    return sprite
//  }

  func camera(offset: CGPoint, height: CGFloat) {
    self.height = height
    let offsetX: CGFloat = mapLocation().x + offset.x
    let offsetY: CGFloat = mapLocation().y + offset.y
    self.position = CGPoint(x: offsetX, y: offsetY)
//    self.setScale(CGFloat(height)/CGFloat(self.size.height-1))
    self.setScale(CGFloat(height)/CGFloat(95))
//    print("[\(self.coordinate.row()),\(self.coordinate.col()),\(offsetX),\(offsetY),\(height),\(CGFloat(height)/CGFloat(self.size.height-1)),\(self.size.height)]")
  }

  static func spriteName(type: Int) -> String {
    switch(type) {
    case 0:
      return "water"
    case 1:
      return "grass"
    case 2:
      return "rock"
    default:
      return "sand"
    }
  }

  func neighbors() -> [Tile] {
    var neighbors: [Tile] = []
    for coordinate in self.coordinate.neighbors() {
      let tile:Tile? = map.tile(coordinate)
      if let tile = tile {
        neighbors.append(tile)
      }
    }
    return neighbors
  }
}
