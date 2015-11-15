//
//  MarkovTerrainGenerator.swift
//  Algo
//
//  Created by Christopher Petersen on 11/14/15.
//  Copyright © 2015 nestedset. All rights reserved.
//

import Foundation

class MarkovTerrainGenerator: TerrainGenerator {
    func generate(radius: Int) -> Map {
        return Map(radius: radius)
    }
}