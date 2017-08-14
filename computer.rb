require_relative '.'

class Computer

  attr_accessor :computermark

  def initialize
    @computermark = nil
  end

  def create_move
    possible_moves = []
    Game.board.all_spaces.each_with_index do |space, idx|
      if space.value == 0  #or board.valid_move?(idx)
        possible_moves << idx
      end
    end
    move = [self.computermark, Game.board.all_spaces[possible_moves.sample]]
  end

end
