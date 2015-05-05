require 'open-uri'
puts open('http://api.umd.io/v0/courses/ENGL101/sections').read