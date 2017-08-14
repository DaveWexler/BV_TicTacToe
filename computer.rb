class Computer

  attr_accessor :computermark

  def initialize
    @computer_mark = nil
  end

  def create_move
    possible_moves = []
    Game.board.all_spaces.each do |space|
      if space.value == 0  #or board.valid_move?(idx)
        possible_moves << space
      end
    end
    move = [self.computer_mark, possible_moves.sample]
  end

end
