require "open-uri"
require "json"
require_relative "./movie"


class	MovieApi
	API_KEY = "q7v6khrbnqjdfanzn7u2cysx"

	def self.search_by_title(title)
		url ="http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=#{API_KEY}&q=#{URI.encode(title)}&page_limit=1"
		first_movie = get_url_as_json(url).fetch("movies").first
		store_movie(OpenStruct.new(first_movie))
	end

	def self.get_url_as_json(url)
		JSON.parse(open(url).read)
	end

	def self.store_movie(movie_struct)
		Movie.new(title: movie_struct.title, id: movie_struct.id, year: movie_struct.year, score: movie_struct.ratings["critics_score"])
	end
end