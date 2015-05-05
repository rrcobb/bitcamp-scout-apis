require 'open-uri'
require 'json'

data = open('http://api.umd.io/v0/courses').read

courses = JSON.parse(data)

puts courses[0]
