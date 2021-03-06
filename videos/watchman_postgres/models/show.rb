class Show < ActiveRecord::Base
	belongs_to :network

	validates_presence_of :name

	def to_s
		"#{name} airs at #{hour_of_day} on #{day_of_week} on #{network}"
	end
end