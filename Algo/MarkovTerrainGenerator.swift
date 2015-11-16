//
//  MarkovTerrainGenerator.swift
//  Algo
//
//  Created by Christopher Petersen on 11/14/15.
//  Copyright © 2015 nestedset. All rights reserved.
//

import Foundation

class MarkovTerrainGenerator: TerrainGenerator {
    // 0 water
    // 1 land
    // 2 mountain
    let markovMatrix: [[Int]] = [
        [80, 15,  5],
        [10, 80, 10],
        [ 5, 15, 80]
    ]    

    func generate(tile: Tile) -> Int {
        var type = tile.type
        if(type == -1) {
            var pool: [Int] = []
            for neighbor in tile.neighbors() {
                if(neighbor.type != -1) {
                    
                }
            }
        }
        return type
    }
}