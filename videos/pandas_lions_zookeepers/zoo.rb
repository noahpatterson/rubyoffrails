module Animal
	

	def likes?(food)
		acceptable_food.include?(food.to_sym)
	end

	def acceptable_food
		[]
	end

	def eat(food)
		@meals ||= 0
		if likes?(food)
			@meals += 1
			true
		else
			false
		end
		# likes?(food) ? @meals +=1 : false
	end
end

class Panda

	include Animal

	def acceptable_food
		# [{type: :bamboo, full: 30}]
		[:bamboo]
	end

	def full?
		@meals > 30
	end
end

class Lion
	include Animal

	def acceptable_food
		# [{type: :wildebeests,full: 1}, {type: :zebras, full: 2}]
		[:wildebeests,:zebras]

	end

	def full?
		@meals > 1
	end
end

class Zookeeper
	def feed(args={})
		food = args.fetch(:food)
		animal = args.fetch(:to)
		animal.eat(food)
	end
end

