puts '----------------------------'
puts 'Welcome to the superfight'
puts '----------------------------'
puts ''
puts ''
puts ''
puts ''
puts ''

puts 'What is your first fighters name?'
fighter_a = $stdin.gets
puts 'what is you second fighters name?'
fighter_b = $stdin.gets

match = Match.new(Fighter.new(fighter_a), Fighter.new(fighter_b))

puts "The winner of match is .......... #{match.winner.name}"
