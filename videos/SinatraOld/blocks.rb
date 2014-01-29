class Logger

  attr_reader :messages

  def initialize
    @messages = []
  end

  def log_it(message, &block)
    puts "before #{message}"
    @messages << message
    yield
    puts "after #{message}"
  end
end

@logger = Logger.new

@logger.log_it "the stuff happened" do 
  10.times do
    puts "its happening"
  end
end


@logger.messages.each do |msg|
  puts msg
end