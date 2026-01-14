class Board
  LINES = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9],  # rows
    [1, 4, 7], [2, 5, 8], [3, 6, 9],  # columns
    [1, 5, 9], [3, 5, 7]              # diagonals
  ]

  attr_accessor :board

  def initialize
    @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def display
    puts ""
    board.each do |row|
      puts row.join("|")
      puts "-----" unless row == board.last
    end
  end
  
  def play(place, player)
    self.board.map! do |row|
      row.map do |column|
        case column
        when place then column = player.char
        else column = column
        end
      end
    end
  end
end
