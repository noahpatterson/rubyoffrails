require 'minitest/autorun'
require 'minitest/pride'
require './furlong'

class FurlongTest < Minitest::Test

	def test_one_mile
		km= Furlong.new.miles_to_kilometers(1)
		assert_in_delta 1.60934, km, 0.001
	end

	def test_marathon
		km= Furlong.new.miles_to_kilometers(26.219)
		assert_in_delta 42.194, km, 0.01
	end
end
