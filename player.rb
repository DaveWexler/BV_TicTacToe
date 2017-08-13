require_relative '.'

class Player

  attr_accessor

  @@players = []

  def initialize(name)
    @name = name
    @record = [0,0,0]
    @mark = nil
    Player.players << self
  end

  def self.find_or_create_player(name)
		person = Player.players.find {|player| player.name == name}
		if person == nil then person = Player.new(name)
		else puts "Welcome back, #{person.name}! Your record is #{person.record[0]} wins, #{person.record[1]} losses, and #{person.record[2]} draw(s)."
		end
	end

end
