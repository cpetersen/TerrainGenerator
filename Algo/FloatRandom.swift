//
//  FloatRandom.swift
//  Algo
//
//  Created by Christopher Petersen on 11/18/15.
//  Copyright © 2015 nestedset. All rights reserved.
//

import Foundation

extension Float {
    static func randomBetween(firstNum: Float, secondNum: Float) -> Float{
        return Float(arc4random()) / Float(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }

    static func random(max: Float) -> Float{
        return randomBetween(0, secondNum: max)
    }
}