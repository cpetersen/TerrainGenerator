//
//  RandomTerrainGenerator.swift
//  Algo
//
//  Created by Christopher Petersen on 11/15/15.
//  Copyright © 2015 nestedset. All rights reserved.
//

import Foundation

class RandonTerrainGenerator: TerrainGenerator {
    func generate(tile: Tile) -> Int {
        var type = tile.type
        if(type == -1) {
            type = Int(arc4random_uniform(3))
        }
        return type
    }
}