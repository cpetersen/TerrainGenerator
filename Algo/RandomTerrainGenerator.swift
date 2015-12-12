//
//  RandomTerrainGenerator.swift
//  Algo
//
//  Created by Christopher Petersen on 11/15/15.
//  Copyright © 2015 nestedset. All rights reserved.
//

import Foundation

class RandomTerrainGenerator: TerrainGenerator {
    func generate(coordinate: Coordinate) -> Int {
        return Int(arc4random_uniform(3))
    }
}