Dir['./lib/*.rb'].each { |file| require file }

puts 'What is your first fighters name?'
fighter_a = gets
puts 'What is your second fighters name?'
fighter_b = gets

match = Match.new(Fighter.new(fighter_a), Fighter.new(fighter_b))

puts "The winner is #{ match.winner.name }"
