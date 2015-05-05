require 'open-uri'
require 'json'

course_data = open("http://api.umd.io/v0/courses/CMSC131").read

course = JSON.parse(course_data)
description = URI.encode(course['description'])

sentiment_data = open("http://api-sentiment.3scale.net/v1/sentence/#{description}.json").read

response = JSON.parse(sentiment_data)

puts response['sentiment']
