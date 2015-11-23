#!/usr/bin/env ruby

require 'chunky_png'

height = 96
width = (height*(Math.sqrt(3.0)/2.0))

northOffset =     [ 0,             (height/2)    ]
southOffset =     [ 0,             -(height/2.0) ]
northwestOffset = [ -(width/2.0),  (height/4.0)  ]
southwestOffset = [ -(width/2.0),  -(height/4.0) ]
northeastOffset = [  (width/2.0),   (height/4.0) ]
southeastOffset = [  (width/2.0),  -(height/4.0) ]

offset = [width/2, height/2]
path = [northOffset, northwestOffset, southwestOffset, southOffset, southeastOffset, northeastOffset, northOffset].collect { |p| [p.first+offset.first,p.last+offset.last] }

colors = {
  autumn: "#e39333",
  dirt: "#ca9a6c",
  grass: "#8dc435",
  lava: "#e97b33",
  magic: "#a681b6",
  rock: "#929f9f",
  sand: "#eee7cd",
  snow: "#e9fcff",
  stone: "#c2d0d1",
  water: "#8be1eb"
}

FileUtils.mkdir_p("tiles")
colors.each do |name, color|
  color = ChunkyPNG::Color.from_hex(color)
  png = ChunkyPNG::Image.new(width.to_i, height, ChunkyPNG::Color::TRANSPARENT)
  png.polygon(path, ChunkyPNG::Color::TRANSPARENT, color)
  png.save("tiles/#{name}.png", :interlace => true)
end
