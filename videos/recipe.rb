ingredients ={}
ingredients[:avocados]=3
ingredients[:jalepenos]=2
#puts ingredients

Recipe = Struct.new(:ingredients, :method)
# recipe = Recipe.new
# recipe.ingredients=ingredients
# recipe.method=["Peel/Slice Avocados", "Chop jalapenos into small dice"]
recipe = Recipe.new({avocados: 4, jalapenos: 3},["Peel/Slice Avocados", "Chop jalapenos into small dice"])


# recipe = {}
# recipe[:ingredients]=ingredients
# recipe[:method]=["Peel/Slice Avocados", "Chop jalapenos into small dice"]


puts "ingredients"
recipe[:ingredients].each do |key,value|
	puts "* #{key}: #{value}"
end
puts "\nMethod:"
recipe[:method].each_with_index do |step,index|
	puts "#{index}: #{step}"
end

