require_relative 'game'
require_relative 'space'
require_relative 'board'
require_relative 'wincrement'

def playagain?
  puts "The game is over! Do you want to play again? (Y/N)"
  input = gets.chomp
  if input == "Y" || input == "y"
    play
  elsif input == "N" || input == "n"
    puts "How about a nice game of Chess?"
  else
    playagain?
  end
end

def play
  tictactoe = Game.new
  until tictactoe.board.won? || tictactoe.board.full?
    tictactoe.turn(tictactoe.current_move)
    tictactoe.board.display_board
    tictactoe.board.won?
    tictactoe.board.full?
  end
  Wincrement.new(tictactoe).run
  playagain?
end

play
