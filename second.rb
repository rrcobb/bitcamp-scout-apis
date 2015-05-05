require 'open-uri'
require 'json'

data = open('http://api.umd.io/v0/courses?sort=course_id&dept_id=CMSC').read

courses = JSON.parse(data)

# get a comma-seperated list of all the course_ids
ids = '' 
courses.each do |course|
  ids += course['course_id'] + ','
end

# now get information about all those ids
data = open("http://api.umd.io/v0/courses/#{ids}").read
courses = JSON.parse(data)

# finally, sum up all the credits
credits = 0
courses.each do |course|
  # .to_i converts the text to a number
  credits += course['credits'].to_i
end

puts credits
