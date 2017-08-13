require_relative '.'

class Game

  attr_accessor

  def initialize
    @board = Board.new
		@computermark = "O"
		@current_player = nil
    self.welcome
    self.mark_select
  end

  def welcome
    puts "Welcome to Tic Tac Toe! Please enter player name: "
		playername = gets.chomp
		@player1 = Player.find_or_create_player(playername)
		@computer_player = Computer.new
  end

  def mark_select
    puts "Please select X or O"
		player1.mark = gets.chomp
		if player1.mark == "X"
			@comp_player.computermark = "O"
			@current_player = :human
		elsif
			player1.mark == "O"
			@comp_player.computermark = "X"
			@current_player = :computer
		else
			self.mark_select
		end
  end

end
