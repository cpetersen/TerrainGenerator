//
//  Matrix.swift
//  Algo
//
//  Created by Christopher Petersen on 11/15/15.
//  Copyright © 2015 nestedset. All rights reserved.
//

import Foundation

//    extension Array<T> where T:Float {
extension CollectionType where Generator.Element == Float {
    func addElements(elements: [Float]) -> [Float] {
        let myZip2 = Zip2Sequence(self,elements)
        var result: [Float] = []
        for elem in myZip2 {
            result.append(elem.0 + elem.1)
        }
        return result
    }
    
    func sum() -> Float {
        return self.reduce(0,combine: +)
    }
    
    func weightedRandomIndex() -> Int {
        let randomValue: Float = Float.random(sum())
        var counter: Float = 0
        var returnVal: Int = 0
        for (index, value) in self.enumerate() {
            counter += value
            if(randomValue < counter) {
                returnVal = index
                break
            }
        }
        return returnVal
    }
}
