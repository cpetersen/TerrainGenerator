//
//  Map.swift
//  Algo
//
//  Created by Christopher Petersen on 11/08/15.
//  Copyright © 2015 nestedset. All rights reserved.
//

import Foundation
import SpriteKit

class Map {
    let radius: Int
    var tiles = Dictionary<Coordinate, Tile>()

    init(radius: Int) {
//        let start = NSDate()
        self.radius = radius
        for xIndex in -radius...radius {
            for yIndex in -radius...radius {
                let coordinate = Coordinate(x: xIndex, y: yIndex)
                if abs(coordinate.z()) <= radius {
                    let tile = Tile(coordinate: coordinate, map: self, type: -1)
                    self.tiles[coordinate] = tile
                }
            }
        }
//        let end = NSDate()
//        let timeInterval: Double = end.timeIntervalSinceDate(start)
//        print("Time to evaluate problem \(timeInterval) seconds")
    }
    
    func tile(coordinate: Coordinate) -> Tile? {
        return tiles[coordinate]
    }
    
    func paths(location: CGPoint) -> [CGMutablePathRef] {
        return tiles.map( { $1.path(location) } )
    }

    func sprites(location: CGPoint) -> [SKSpriteNode] {
        return tiles.map( { $1.sprite(location) } )
    }
}

