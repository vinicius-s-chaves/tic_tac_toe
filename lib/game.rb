require_relative 'game/board'
require_relative 'game/player'

class Game
  def initialize
    @p1 = Player.new('x', "Player 1")
    @p2 = Player.new('o', "Player 2")
    @board = Board.new
  end
  
  def self.start
    while @@status == 'in_game'
      self.round(@@p1)
      break if @@status != 'in_game'
      self.round(@@p2)
    end
  end

  private

  def self.round(player)
    print "#{player.name} (#{player.char}): "
    Board.play(self.space, player)
    self.status
  end
  
  def self.space
    puts "Choose a space:"
    Board.display
    space = gets.chomp
    space
  end

  def self.status
    current_board = Board.board
    self.draw?(@@initial_board, current_board)
    self.row_win?(current_board)
    self.column_win?
    self.diagonal_win?(current_board)
  end

  def self.draw?(initial_board, current_board)
    if initial_board - current_board.flatten == initial_board
      @@status = 'draw'
    end
  end

  def self.row_win?(board)
    board.each do |row|
      if row.uniq == ['x'] || row.uniq == ['o']
        @@status = 'winner'
        self.winner = row.uniq
      end
    end
  end

  def self.column_win?
    Board.column.each do |column|
      if column.uniq == ['x'] || column.uniq == ['o']
        @@status = 'winner'
        self.winner = column.uniq
      end
    end
  end

  def self.diagonal_win?(board)
    Board.diagonal.each do |diagonal|
      if diagonal.uniq == ['x'] || diagonal.uniq == ['o']
        @@status = 'winner'
        self.winner = diagonal.uniq
      end
    end
  end

  def self.winner=(line)
    Board.display
    puts "#{line.pop.upcase} WINS!"
  end
end