//
//  Map.swift
//  Algo
//
//  Created by Christopher Petersen on 11/08/15.
//  Copyright © 2015 nestedset. All rights reserved.
//

import Foundation

class Map {
    let radius: Int
    var tiles = Dictionary<Coordinate, Tile>()

    init(radius: Int) {
        self.radius = radius
        for xIndex in -radius...radius {
            for yIndex in -radius...radius {
                let coordinate = Coordinate(x: xIndex, y: yIndex)
                let tile = Tile(coordinate: coordinate)
                self.tiles[coordinate] = tile
            }
        }
        
    }
    
    func paths(location: CGPoint) -> [CGMutablePathRef] {
        return tiles.map( { $1.path(location) } )
    }
}
