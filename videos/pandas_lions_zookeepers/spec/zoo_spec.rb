require 'rspec'
require '../../../spec_helper'
require '../zoo'



describe Panda do 
	it "should like bamboo" do
		expect(Panda.new.likes?(:bamboo)).to eq(true)
	end

	it "should like bamboo as a string" do
		expect(Panda.new.likes?('bamboo')).to eq(true)
	end

	it "should not like pizza" do
		expect(Panda.new.likes?(:pizza)).to eq(false)
	end

	it "should be able to eat the food" do
		expect(Panda.new.eat(:bamboo)).to eq(true)
	end

	it "should be full after eating 30 bamboo" do
		panda = Panda.new
		31.times {panda.eat(:bamboo)}
		expect(panda).to be_full
	end

	it "should not be full after 1 bamboo" do
		panda = Panda.new
		panda.eat(:bamboo)
		expect(panda).to_not be_full
	end
end

describe Lion do
	it "should like wildebeests" do
		expect(Lion.new.likes?(:wildebeests)).to eq(true)
	end

	it "should like zebras" do 
		expect(Lion.new.likes?(:wildebeests)).to eq(true)
	end

	it "should not like salad" do
		expect(Panda.new.likes?(:salad)).to eq(false)
	end

	it "should be able to eat the food" do
		expect(Lion.new.eat(:zebras)).to eq(true)
	end

	it "should be full after eating 2 zebra" do
		lion = Lion.new
		2.times {lion.eat(:zebras)}
		expect(lion).to be_full
	end

	it "should not be full after 1 zebra" do
		lion = Lion.new
		lion.eat(:zebras)
		expect(lion).to_not be_full
	end
end

describe Zookeeper do
	it "should be able to feed bamboo to the pandas" do
		panda = Panda.new
		expect(panda).to receive(:eat).with(:bamboo)
		#choosing a hash allows users to pass food and to in any order
		expect(Zookeeper.new.feed(food: :bamboo, to: panda))

	end

	it "should be able to feed zebras to the lions" do
		lion = Lion.new
		expect(lion).to receive(:eat).with(:zebras)
		#choosing a hash allows users to pass food and to in any order
		expect(Zookeeper.new.feed(food: :zebras, to: lion))
	end
end