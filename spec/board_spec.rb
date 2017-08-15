require_relative '../board.rb'

describe "Board" do

  describe "#won_row?" do
    it "successfully checks to see if a game is won via row" do
      a = Board.new(3)
      a.board[1][0].mark_x
      a.board[1][1].mark_x
      a.board[1][2].mark_x
      expect(a.won_row?).to eq(true)
    end
  end

  describe "#won_column?" do
    it "successfully checks to see if a game is won via column" do
      a = Board.new(3)
      a.board[0][1].mark_x
      a.board[1][1].mark_x
      a.board[2][1].mark_x
      expect(a.won_column?).to eq(true)
    end
  end

  describe "#won_left_diagonal?" do
    it "successfully checks to see if a game is won via diagonal from upper-left" do
      a = Board.new(3)
      a.board[0][0].mark_x
      a.board[1][1].mark_x
      a.board[2][2].mark_x
      expect(a.won_left_diagonal?).to eq(true)
    end
  end

  describe "#won_right_diagonal?" do
    it "successfully checks to see if a game is won via diagonal from upper-left" do
      a = Board.new(3)
      a.board[0][2].mark_x
      a.board[1][1].mark_x
      a.board[2][0].mark_x
      expect(a.won_right_diagonal?).to eq(true)
    end
  end
end
