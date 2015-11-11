//
//  Tile.swift
//  Algo
//
//  Created by Christopher Petersen on 10/31/15.
//  Copyright © 2015 nestedset. All rights reserved.
//

import Foundation

class Tile {
  let height: CGFloat = 64
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

  func path(location: CGPoint) -> CGMutablePathRef {
    let path:CGMutablePathRef = CGPathCreateMutable()

    CGPathMoveToPoint(path, nil, location.x+northOffset.x, location.y+northOffset.y)
    CGPathAddLineToPoint(path, nil, location.x+northwestOffset.x, location.y+northwestOffset.y)
    CGPathAddLineToPoint(path, nil, location.x+southwestOffset.x, location.y+southwestOffset.y)
    CGPathAddLineToPoint(path, nil, location.x+southOffset.x, location.y+southOffset.y)
    CGPathAddLineToPoint(path, nil, location.x+southeastOffset.x, location.y+southeastOffset.y)
    CGPathAddLineToPoint(path, nil, location.x+northeastOffset.x, location.y+northeastOffset.y)
    CGPathAddLineToPoint(path, nil, location.x+southOffset.x, location.y+northOffset.y)

    return path
  }
}
