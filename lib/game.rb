require_relative 'game/board'
require_relative 'game/player'

class Game
  def initialize
    @p1 = Player.new('x', "Player 1")
    @p2 = Player.new('o', "Player 2")
    @board = Board.new
    @current_player = @p2

    self.start
  end
  
  private

  def start
    until win?
      switch_player!
      round(@current_player)
      if draw?
        @board.display
        puts "It's a draw!"
        break
      end
    end
    winner
  end

  def round(player)
    print "#{player.name} (#{player.char}): "
    @board.play(self.space, player)
  end
  
  def space
    puts "Choose a space:"
    @board.display
    space = gets.chomp.to_i
    unless @board.board.any? { |row| row.include?(space) }
      puts "\nChoose a valid space!"
      round(@current_player)
    end
    space
  end

  def draw?
    initial_board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    initial_board - @board.board.flatten == initial_board
  end

  def win?
    rows? ||
    columns? ||
    diagonals?
  end

  def rows?
    @board.board.any? { |row| row.all? { |space| space == @current_player.char } }
  end

  def columns?
    (0..2).any? do |index|
      (0..2).all? { |space| @board.board[space][index] == @current_player.char}
    end
  end

  def diagonals?
    (0..2).all? { |index| @board.board[index][index] == @current_player.char} ||
    (0..2).all? { |index| @board.board[index][2 - index] == @current_player.char}
  end

  def switch_player!
    @current_player = @current_player == @p1 ? @p2 : @p1
  end

  def winner
    unless draw?
      @board.display
      puts "#{@current_player.name} WINS!"
    end
  end
end