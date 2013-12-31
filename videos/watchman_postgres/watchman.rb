require 'bundler/setup'

require './db/setup'
Dir.glob('./models/*').each { |r| require r }
require "./db/seed"

puts "there are #{Show.count} shows in the database"

# Show.all.each do |show|
# 	puts show
# end

Network.all.each do |network|
	puts "Shows airing on #{network}"
	network.shows.each do |show|
		puts show
	end
end
