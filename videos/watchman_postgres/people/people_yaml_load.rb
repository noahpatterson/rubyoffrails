require 'yaml'

all_people = YAML::load(File.open('test.yml'))


class Person
	attr_accessor :name, :age, :kids
end

people = all_people.map do |person|
	p = Person.new
	p.name = person.fetch("name")
	p.age = person.fetch("age")
	p.kids = person.fetch("kids")
	p
end

people.each { |p| puts p.inspect }

# puts contents.fetch("jane").fetch("age")