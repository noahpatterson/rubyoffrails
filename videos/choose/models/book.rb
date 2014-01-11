

class Book
  attr_reader :current_page

  def initialize
    @current_page = Page.starting_point
  end

  def input(input_string)
    input = input_string.chomp
    if input == "A"
      @current_page = current_page.options.first
    elsif input == "B"
      @current_page = current_page.options.last
    end
  end

  def complete_game?
    @current_page.conclusion?
  end

end