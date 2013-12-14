require './lib/api'

def movie_search_by_title
	puts "OH HAI. Please enter movie title"
	print ">>" 
	movie_title = gets
	puts "Cool, searching for #{movie_title}"
	search = MovieApi.search_by_title(movie_title)
	puts "#{movie_title} was released in #{search.year}. It recieved a critics score of #{search.score}"
end

def search_again(response)
	if response == "yes"
		movie_search_by_title
	elsif response == "no"
		false
	else
		puts "I don't understand that"
	end
end

movie_search_by_title

while true
	puts "Search Again?"
	re_search = gets.downcase.chomp
	search_again(re_search) ? true : break
end


