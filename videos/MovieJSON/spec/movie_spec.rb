require 'rspec'
require '../../spec_helper'
require_relative '../lib/movie'


describe Movie do
	it "should store title,year and score" do
	  movie = Movie.new(id: "123", title: "the-title", year: 1998, score: 50)
	  expect(movie.id).to eq("123")
	  expect(movie.title).to eq("the-title")
	  expect(movie.year).to eq(1998)
	  expect(movie.score).to eq(50)	  
	end

end