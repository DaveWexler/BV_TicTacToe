require_relative '.'

class Game

  attr_accessor

  def initialize
    @board = Board.new
		@computermark = "O"
		@current_player = nil
  end

end
