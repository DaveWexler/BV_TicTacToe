require_relative 'space'
require 'pry'

class Board

  attr_accessor :board
  attr_reader :n

  def initialize(n)
    @n = n
    @board = self.new_board
  end

  def new_row
    row = Array.new(self.n) {Space.new}
  end

  def new_board
    board = []
    (self.n).times do
      board << new_row
    end
    board
  end

  def display_board
    puts "\n"
    self.board[0..-2].each do |row|
      row_string = ""
      row[0..-2].each do |space|
        row_string << " #{space.mark} |"
      end
      row_string << " #{row[-1].mark}\n"
      (self.n*4-1).times do
        row_string << "-"
      end
      row_string << "\n"
      puts row_string
    end
    last_row = ""
    self.board[-1][0..-2].each do |space|
      last_row << " #{space.mark} |"
    end
    last_row << " #{self.board[-1][-1].mark}"
    puts last_row
    puts "\n"
  end

  def all_spaces
    self.board.flatten
  end

  def valid_move?(space)
    true if space.value == 0
  end

  def won_row?
    value_array = self.board.each_with_object([]) do |row, row_values|
      row_values << row.map {|space| space.value}
    end
    #if the sum of any row_values array equals n or -n, return true
    sums = value_array.map do |nums_array|
      nums_array.inject(0, :+)
    end
    sums.any? {|sum| sum == self.n || sum == -(self.n)}
  end

  def won_column?
    column_idxs = (0..self.n-1).to_a
    value_array = column_idxs.map do |column_idx|
      vals = self.board.map do |row|
        row[column_idx].value
      end
    end
    sums = value_array.map do |nums_array|
      nums_array.inject(0, :+)
    end
    sums.any? {|sum| sum == self.n || sum == -(self.n)}
  end

end
