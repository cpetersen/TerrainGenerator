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
    let markovMatrix: [[Float]] = [
        [90.0,  1.0,  0.0],
        [ 1.0, 90.0,  5.0],
        [ 0.0, 30.0, 50.0]
    ]    
    let map: Map;
    
    init(map: Map) {
        self.map = map
    }
    
    func generate(coordinate: Coordinate) -> Int {
        var type = -1
        var weights: [Float]?
        for neighbor in self.map.neighbors(coordinate) {
            if(neighbor.type>=0 && neighbor.type<markovMatrix.count) {
                if let w = weights {
                    weights = w.addElements(markovMatrix[neighbor.type])
                } else {
                    weights = markovMatrix[neighbor.type]
                }
            }
        }
        if let w = weights {
            type = w.weightedRandomIndex()
        } else {
            type = markovMatrix[Int(arc4random_uniform(UInt32(markovMatrix.count)))].weightedRandomIndex()
        }
        return type
    }
}