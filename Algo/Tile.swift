//
//  Tile.swift
//  Algo
//
//  Created by Christopher Petersen on 10/31/15.
//  Copyright © 2015 nestedset. All rights reserved.
//

import Foundation

class Tile {
  let height: CGFloat = 16
  var width: CGFloat { return (height*(sqrt(3.0)/2.0)) }

  var northOffset: CGPoint { return CGPoint(x: 0, y: (height/2.0)) }
  var southOffset: CGPoint { return CGPoint(x: 0, y: -(height/2.0)) }
  var northwestOffset: CGPoint { return CGPoint(x: -(width/2.0), y:  (height/4.0)) }
  var southwestOffset: CGPoint { return CGPoint(x: -(width/2.0), y: -(height/4.0)) }
  var northeastOffset: CGPoint { return CGPoint(x:  (width/2.0), y:  (height/4.0)) }
  var southeastOffset: CGPoint { return CGPoint(x:  (width/2.0), y: -(height/4.0)) }

  var coordinate: Coordinate
  
  init(coordinate: Coordinate) {
    self.coordinate = coordinate
  }
  
  func mapLocation() -> CGPoint {
    let x: CGFloat = width*CGFloat(coordinate.row())
    let y: CGFloat = height*CGFloat(coordinate.col())
    return CGPoint(x:x,y:y)
  }

  func path(offset: CGPoint) -> CGMutablePathRef {
    let path:CGMutablePathRef = CGPathCreateMutable()

    let offsetX: CGFloat = mapLocation().x + offset.x
    let offsetY: CGFloat = mapLocation().y + offset.y
    CGPathMoveToPoint(path, nil, offsetX+northOffset.x, offsetY+northOffset.y)
    CGPathAddLineToPoint(path, nil, offsetX+northwestOffset.x, offsetY+northwestOffset.y)
    CGPathAddLineToPoint(path, nil, offsetX+southwestOffset.x, offsetY+southwestOffset.y)
    CGPathAddLineToPoint(path, nil, offsetX+southOffset.x, offsetY+southOffset.y)
    CGPathAddLineToPoint(path, nil, offsetX+southeastOffset.x, offsetY+southeastOffset.y)
    CGPathAddLineToPoint(path, nil, offsetX+northeastOffset.x, offsetY+northeastOffset.y)
    CGPathAddLineToPoint(path, nil, offsetX+southOffset.x, offsetY+northOffset.y)

    return path
  }
}
