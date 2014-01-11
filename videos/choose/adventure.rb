require 'bundler/setup'

require_relative 'db/setup'
require_relative 'models/page'
require_relative 'models/book'

start = Page.create(starting_point: true, content: "You woke up on a road. It's foggy and dampy. In your pocket are 30 gold coins and a tofu sandwhich. Which do you choose?")

option_a = Page.create(conclusion: true, parent_id: start.id, content: "You found awesome thing. Your win!")
option_a = Page.create(conclusion: true, parent_id: start.id, content: "loser")

book = Book.new

until book.complete_game? do
  puts book.current_page.content
  puts "your options: "
  puts " - [#Door A]"
  puts " - [Door B]"
  puts "What do you want to do? Enter A or B"

  book.input( gets )

  puts book.current_page.content

end

puts "hope you won!"