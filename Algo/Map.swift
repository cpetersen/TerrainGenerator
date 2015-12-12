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
    var offset: CGPoint = CGPoint(x: 0, y: 0)
    var height: CGFloat = 32
    
    init(radius: Int, terrainGenerator: TerrainGenerator) {
//        let start = NSDate()
        self.radius = radius
        for yIndex in -radius...radius {
            for xIndex in -radius...radius {
                let coordinate = Coordinate(x: xIndex, y: yIndex)
                if abs(coordinate.z()) <= radius {
                    let tile = Tile(coordinate: coordinate, map: self, type: terrainGenerator.generate(coordinate))
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

    func neighbors(coordinate: Coordinate) -> [Tile] {
        var neighbors: [Tile] = []
        for neighbor in coordinate.neighbors() {
            let tile:Tile? = self.tile(neighbor)
            if let tile = tile {
                neighbors.append(tile)
            }
        }
        return neighbors
    }

    func camera(offset: CGPoint, height: CGFloat) {
        if(self.height == height && self.offset == offset) {
            
        } else {
            self.offset = offset
            self.height = height
            for (_, tile) in self.tiles {
                tile.camera(offset, height: height)
            }
        }
    }
//    func paths(location: CGPoint) -> [CGMutablePathRef] {
//        return tiles.map( { $1.path(location) } )
//    }

//    func sprites(location: CGPoint) -> [SKSpriteNode] {
//        return tiles.map( { $1.sprite(location) } )
//    }
//
//    func sprites(location: CGPoint, height: CGFloat) -> [SKSpriteNode] {
//        return tiles.map( { $1.sprite(location, height: height) } )
//    }
}

