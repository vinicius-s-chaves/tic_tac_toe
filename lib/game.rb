require_relative 'game/board'
require_relative 'game/player'

class Game
  attr_accessor :p1, :p2
  
  def self.start
    @@status = 'in_game'

    @p1 = Player.new(self.set_char)
    @p2 = Player.new(self.set_char)

    while @@status == 'in_game'
      self.round(@p1)
      break if @@status != 'in_game'
      self.round(@p2)
    end
  end

  private

  def self.set_char
    puts "Choose your char (x/o)"
    char = gets.chomp.downcase
    char
  end

  def self.round(player)
    print "Player #{player}: "
    Board.play(self.space, player)

    self.status
  end
  
  def self.space
    puts "Choose a space:"
    p Board.display
    space = gets.chomp
    space
  end

  def self.status
    initial_board = [%w[a1 a2 a3], %w[b1 b2 b3], %w[c1 c2 c3]].flatten
    current_board = Board.display

    if initial_board - current_board.flatten == initial_board
      @@status = 'draw'
    end

    current_board.each do |row|
      if row.uniq == ['x'] || row.uniq == ['o']
        @@status = 'winner'
      end
    end
  end
end