require_relative '.'

class Board

  attr_accessor :board
  attr_reader :n

  def initialize(n)
    @n = n
    @board = self.new_board


  end

  def new_row
    row = Array.new(self.n, Space.new)
  end

  def new_board
    board = []
    (self.n).times do
      board << new_row
    end
    board
  end
end
