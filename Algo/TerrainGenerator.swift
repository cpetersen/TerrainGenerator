//
//  TerrainGenerator.swift
//  Algo
//
//  Created by Christopher Petersen on 11/14/15.
//  Copyright © 2015 nestedset. All rights reserved.
//

import Foundation

protocol TerrainGenerator {
    func generate(coordinate: Coordinate) -> Int
}