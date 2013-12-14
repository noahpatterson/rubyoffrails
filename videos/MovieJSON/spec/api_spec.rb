require 'rspec'
require '../../spec_helper'
require_relative "../lib/api"


describe MovieApi do 

	let(:movie) {MovieApi.search_by_title("Forrest Gump")}

	before do
		MovieApi.stub(:get_url_as_json) {JSON.parse(File.read("spec/fixtures/forrest.json"))}
	end


	it "should search for movies" do
	  expect(movie.title).to eq("Forrest Gump")
	end

	it "should return the score" do
	  expect(movie.score).to eq(71)
	end

	it "should return the id" do
	  expect(movie.id).to eq("10036")
	end

	it "should return the year" do
	  expect(movie.year).to eq(1994)
	end

	it "should store the movie" do
		# movie_object = MovieApi.store_movie(movie)
	  	expect(movie.title).to eq("Forrest Gump")
	  	expect(movie.year).to eq(1994)
	  	expect(movie.id).to eq("10036")
	  	expect(movie.score).to eq(71)
	end
end