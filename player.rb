class Player

  attr_accessor :mark, :record
  attr_reader :name

  @@players = []

  def initialize(name)
    @name = name
    @record = [0,0,0]
    @mark = nil
    Player.players << self
  end

  def self.players
		@@players
	end

  def self.find_or_create_player(name)
		person = Player.players.find {|player| player.name == name}
		if person == nil then person = Player.new(name)
		else puts "Welcome back, #{person.name}! Your record is #{person.record[0]} wins, #{person.record[1]} losses, and #{person.record[2]} draw(s)."
		end
	end

  def create_move
    puts "Pick the row number that contains the space you wish to choose."
    row_number = gets.chomp
    puts "Pick the column number within that row of the space you wish to choose."
    column_number = gets.chomp
    [self.mark, Game.board[row_number-1][column_number-1]]
  end
end
