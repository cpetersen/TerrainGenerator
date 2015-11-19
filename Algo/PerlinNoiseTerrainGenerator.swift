//
//  MarkovTerrainGenerator.swift
//  Algo
//
//  Created by Christopher Petersen on 11/14/15.
//  Copyright © 2015 nestedset. All rights reserved.
//

import Foundation

// http://devmag.org.za/2009/04/25/perlin-noise/
class PerlinNoiseTerrainGenerator: TerrainGenerator {
//    let height: Int
//    let width: Int
//    var baseNoise: [[Float]]
    var perlinNoise: [[Float]]
    
    init(height: Int, width: Int, octaves: Int) {
//        self.height = height
//        self.width = width
        var baseNoise: [[Float]] = Array(count:height, repeatedValue:[Float](count: width, repeatedValue: 0.0))

        for row in 0..<height {
            for col in 0..<width {
                baseNoise[row][col] = Float.random(1.0)
            }
        }
        self.perlinNoise = PerlinNoiseTerrainGenerator.generatePerlinNoise(baseNoise, octaveCount: octaves)
    }

    static func generateSmoothNoise(baseNoise: [[Float]], height: Int, width: Int, k: Int) -> [[Float]] {
        var smoothNoise = Array(count: height, repeatedValue:[Float](count: width, repeatedValue: 0.0))
        let samplePeriod: Int = 1 << k
        let sampleFrequency: Float = 1.0 / Float(samplePeriod)

        for row in 0..<height {
            //calculate the vertical sampling indices
            let sample_i0: Int = (row / samplePeriod) * samplePeriod
            let sample_i1: Int = (sample_i0 + samplePeriod) % width; //wrap around
            let horizontal_blend: Float = Float(row - sample_i0) * sampleFrequency;

            for col in 0..<width {
                //calculate the horizontal sampling indices
                let sample_j0: Int = (col / samplePeriod) * samplePeriod
                let sample_j1: Int = (sample_j0 + samplePeriod) % height; //wrap around
                let vertical_blend: Float = Float(col - sample_j0) * sampleFrequency;
                
                //blend the top two corners
                let top: Float = PerlinNoiseTerrainGenerator.interpolate(baseNoise[sample_i0][sample_j0], x1: baseNoise[sample_i1][sample_j0], alpha: horizontal_blend)

                //blend the bottom two corners
                let bottom: Float = PerlinNoiseTerrainGenerator.interpolate(baseNoise[sample_i0][sample_j1], x1: baseNoise[sample_i1][sample_j1], alpha: horizontal_blend)

                //final blend
                smoothNoise[row][col] = PerlinNoiseTerrainGenerator.interpolate(top, x1: bottom, alpha: vertical_blend)
            }
        }

        return smoothNoise
    }

    static func interpolate(x0: Float, x1: Float, alpha: Float) -> Float {
        return x0 * (1 - alpha) + alpha * x1
    }

    static func generatePerlinNoise(baseNoise: [[Float]], octaveCount: Int) -> [[Float]] {
        let width: Int = baseNoise.count
        let height: Int = baseNoise[0].count

        var smoothNoise: [[[Float]]] = Array(count:octaveCount, repeatedValue:Array(count: width, repeatedValue: [Float](count: height, repeatedValue: 0.0)))
    
        let persistance: Float = 0.5
    
        for octave in 0..<octaveCount {
            smoothNoise[octave] = PerlinNoiseTerrainGenerator.generateSmoothNoise(baseNoise, height: height, width: width, k: octave)
        }

        var localPerlinNoise: [[Float]] = Array(count:height, repeatedValue:[Float](count: width, repeatedValue: 0.0))

        var amplitude: Float = 1.0
        var totalAmplitude: Float = 0.0

        for octave in (octaveCount-1).stride(to: 0, by: -1) {
            amplitude *= persistance
            totalAmplitude += amplitude
            for col in 0..<width {
                for row in 0..<height {
                    let val = smoothNoise[octave][col][row] * amplitude
                    localPerlinNoise[col][row] += val
                }
            }
        }

        //normalisation
        for row in 0..<height {
            for col in 0..<width {
                localPerlinNoise[row][col] /= totalAmplitude
            }
        }
    
        return localPerlinNoise
    }


    let water: Float = 0.5
    let land: Float = 0.8
    func generate(tile: Tile) -> Int {
        let width: Int = perlinNoise.count
        let height: Int = perlinNoise[0].count
//        let val: Float = perlinNoise[abs(tile.coordinate.col())%width][abs(tile.coordinate.row())%height]
        let val: Float = perlinNoise[abs(tile.coordinate.x)%width][abs(tile.coordinate.y)%height]
        switch(val) {
        case (0...water):
            return 0
        case (water...land):
            return 1
        default:
            return 2
        }
    }
}