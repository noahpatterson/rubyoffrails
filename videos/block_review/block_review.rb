require 'rubygems'
require 'bundler/setup'

require_relative 'db/setup'
Dir.glob("./models/**/*.rb").each {|f| require f}

# widget = {color: "titanium", :price => "eleventy-billion", locations: [austin, dallas, san Antonio]}

# "panda #{widget}" # does validate
# 'panda #{widget}' #does not validate

# :panda #symbol, takes less overhead because it reduces down to a number, doesn't change from the outside world

#code is split in general 1 class per file

#select based on true or false
new_array1 = [1,2,3,4,5,6].select do |i|
  i > 3 
end
#.reject returns the false
#comapct: removes nil


#sort
new_array2 = [1,3,5,123,4,9,2].sort do |a,b|
  a <=> b #tells the direction of the sort
end
puts new_array2

# widget = Widget.new
# widget.ohai
# puts widget.sku

# second_widget = Widget.new #instance variable on lives within the instance of this object

#load model into a string
klass =  File.open("models/widget.rb", "r") { |file| file.read }
eval(klass) #eval loads the code in the file

puts Widget.new.inspect

puts "Serenity now!"
