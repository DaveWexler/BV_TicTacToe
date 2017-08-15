class Wincrement

	attr_accessor :game

	def initialize(game)
		@game = game
	end

	def run
	  if self.game.board.won? == true
	    if self.game.winner == :human
	      self.game.player1.record[0] += 1
        puts "Conratulations, you won!"
	    elsif self.game.winner == :computer
	      self.game.player1.record[1] += 1
        puts "Sorry, you lost. Try again!"
	    end
	  else
	    self.game.player1.record[2] += 1
      puts "The game ended in a draw."
	  end
	end

end
