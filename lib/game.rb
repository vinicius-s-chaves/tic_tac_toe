require_relative 'game/board'
require_relative 'game/player'

class Game
  attr_accessor :p1, :p2
  
  def self.start
    @@status = 'in_game'

    @p1 = Player.new(self.set_char)
    @p2 = Player.new(self.set_char)

    while @@status == 'in_game'
      self.round
    end
  end

  private

  def self.set_char
    puts "Choose your char (x/o)"
    char = gets.chomp.downcase
    char
  end

  def self.round
    print "Player 1: "
    Board.play(self.space, @p1)

    print "Player 2: "
    Board.play(self.space, @p2)
  end
  
  def self.space
    puts "Choose a space:"
    p Board.display
    space = gets.chomp
    space
  end
end