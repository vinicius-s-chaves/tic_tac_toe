require_relative 'game/board'
require_relative 'game/player'

class Game
  attr_accessor :p1, :p2

  def self.start
    @@status = 'in_game'

    @p1 = Player.new(self.choose)
    @p2 = Player.new(self.choose)
  end

  private

  def self.choose
      puts "Choose your char (x/o)"
      char = gets.chomp.downcase
      char
  end
end