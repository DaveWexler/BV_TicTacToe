class Player

  attr_accessor :mark, :record
  attr_reader :name

  @@players = []

  def initialize(name)
    @name = name
    @record = [0,0,0]
    @mark = nil
    @@players << self
  end

  def self.players
		@@players
	end

  def self.find_or_create_player(name)
		person = Player.players.find {|player| player.name == name}
		if person == nil then person = Player.new(name)
		else
      puts "Welcome back, #{person.name}! Your record is #{person.record[0]} win(s), #{person.record[1]} loss(es), and #{person.record[2]} draw(s)."
      person
		end
	end

  def create_move
    puts "Pick the row number that contains the space you wish to choose."
    row_number = Integer(gets) rescue false
    puts "Pick the column number within that row of the space you wish to choose."
    column_number = Integer(gets) rescue false
    if row_number && column_number
      [row_number-1, column_number-1]
    else
      puts "I'm sorry, I didn't understand those coordinates. Please enter integers."
      self.create_move
    end
  end
end
