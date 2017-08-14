class Computer

  attr_accessor :computer_mark

  def initialize
    @computer_mark = nil
  end

  def create_move(all_spaces)
    possible_moves = []
    all_spaces.each do |space|
      if space.value == 0
        possible_moves << space
      end
    end
    move = [self.computer_mark, possible_moves.sample]
  end

end
