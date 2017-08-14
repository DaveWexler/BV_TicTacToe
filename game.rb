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
			@computer_player.computermark = "O"
			@current_player = :human
		elsif
			player1.mark == "O"
			@computer_player.computermark = "X"
			@current_player = :computer
		else
			self.mark_select
		end
  end

  def switch_player
    if self.current_player == :human
      self.current_player = :computer
    else
      self.current_player = :human
    end
  end

  def current_move
    if self.current_player == :human
      self.player1.create_move
    else
      self.computer_player.create_move
    end
  end

  def turn(array) #current_move
		if self.board.valid_move?(array[1]) == true
			board.place_mark(array)
			self.switch_player
		else
      puts "Sorry, that's an invalid move. Try again."
			self.turn(self.current_move)
		end
	end

end
