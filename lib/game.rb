require_relative 'game/board'
require_relative 'game/player'

class Game
  def initialize
    @p1 = Player.new('x', "Player 1")
    @p2 = Player.new('o', "Player 2")
    @board = Board.new
    @current_player = @p1

    self.start
  end
  
  private

  def start
    until false
      round(@current_player)
      switch_player!
    end
  end

  def round(player)
    print "#{player.name} (#{player.char}): "
    @board.play(self.space, player)
  end
  
  def space
    puts "Choose a space:"
    @board.display
    space = gets.chomp.to_i
    space
  end

  def status
    current_board = @board.board
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

  def switch_player!
    @current_player = @current_player == @p1 ? @p2 : @p1
  end

  def self.winner=(line)
    Board.display
    puts "#{line.pop.upcase} WINS!"
  end
end