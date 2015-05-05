require 'open-uri'
require 'json'

my_course_sections = "CMSC131-0101,ENGL393-0101,ARTT100-0101"
data = open("http://api.umd.io/v0/courses/sections/#{my_course_sections}").read

sections = JSON.parse(data)

sections.each do |section|
  course_id = section['course']

  section['meetings'].each do |meet|
    days     = meet['days']
    times    = meet['start_time']
    building = meet['building']
    room     = meet['room']
    type     = meet['classtype']

    puts "#{course_id} #{type} on #{days} at #{times} in #{building} #{room}."
  end
end
