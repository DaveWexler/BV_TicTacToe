require_relative 'board'
require_relative 'player'
require_relative 'computer'
require 'pry'

class Game

  attr_accessor :board, :current_player, :player1, :computer_player

  def initialize
    @board = nil
		@current_player = nil
    self.welcome
    self.mark_select
    self.build_board
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

  def build_board
    puts "How many rows/colums would you like to have (A normal game of tic tac toe is 3)?"
    n = gets.chomp.to_i
    self.board = Board.new(n)
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
