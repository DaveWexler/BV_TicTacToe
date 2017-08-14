require_relative 'game'
require_relative 'space'
require_relative 'board'

def playagain?
  puts "The game is over! Do you want to play again? (Y/N)"
  input = gets.chomp
  if input == "Y"
    play
  elsif input == "N"
    puts "How about a nice game of Global Thermonuclear War?"
  else
    playagain?
  end
end

def play
  tictactoe = Game.new
  until tictactoe.won_row? || tictactoe.won_column?
    tictactoe.turn(tictactoe.current_move)
    tictactoe.board.display_board
    tictactoe.won_row?
    tictactoe.won_column?
  end

  # until tictactoe.board.winning(tictactoe.board.board_spots) == true || tictactoe.board.full?(tictactoe.board.board_spots) == true
  #   tictactoe.turn(tictactoe.current_move)
  #   tictactoe.board.display_board
  #   tictactoe.board.winning(tictactoe.board.board_spots)
  #   tictactoe.board.full?(tictactoe.board.board_spots)
  # end
  # Wincrement.new(tictactoe).run
  playagain?
end

play
