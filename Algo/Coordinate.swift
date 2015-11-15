//
//  Coordinate.swift
//  Algo
//
//  Created by Christopher Petersen on 11/08/15.
//  Copyright © 2015 nestedset. All rights reserved.
//

import Foundation

class Coordinate {
    let x: Int
    let y: Int
  
    var hashValue: Int {
        return x ^ y
    }

    func z() -> Int {
        return -(x+y)
    };

    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }

    init(x: Int, z: Int) {
        self.x = x
        self.y = -(x+z)
    }

    init(y: Int, z: Int) {
        self.y = y
        self.x = -(y+z)
    }

    
    func col() -> Int {
        return (x+(z()-(z()%2))/2)
    }
    
    func row() -> Int {
        return z()
    }

    func neighbors() -> [Coordinate] {
        return [
            Coordinate(x: self.x, y: self.y+1),
            Coordinate(x: self.x, y: self.y-1),
            Coordinate(x: self.x, z: self.z()+1),
            Coordinate(x: self.x, z: self.z()+1),
            Coordinate(y: self.y, z: self.z()+1),
            Coordinate(y: self.y, z: self.z()+1)
        ]
    }
}

extension Coordinate: Hashable {}

func ==(lhs: Coordinate, rhs: Coordinate) -> Bool {
    return lhs.x == rhs.x && lhs.y == rhs.y
}
