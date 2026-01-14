class Board
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
