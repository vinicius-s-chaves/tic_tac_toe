class Board
  @@board = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]

  def self.display
    puts ""
    @@board.each do |row|
      puts row.join("|")
      puts "-----" unless row == @@board.last
    end
  end

  def self.board
    @@board
  end
  
  def self.play(place, player)
    @@board = @@board.map do |row|
      row.map do |column|
        case column
        when place then column = player.char
        else column = column
        end
      end
    end
  end

  def self.column
    board_by_column = []
    for i in (0..2)
      column = []
      self.board.each do |row|
        row.each_with_index do |space, index|
          column << space if index == i
        end
      end
      board_by_column << column
    end
    board_by_column
  end

  def self.diagonal
    board_by_diagonal = []
    diagonal_by_left = (diagonal_left(Array.new))
    diagonal_by_right = (diagonal_right(Array.new))
    board_by_diagonal << diagonal_by_left
    board_by_diagonal << diagonal_by_right
    
    board_by_diagonal
  end

  def self.diagonal_left(board_diagonal)
    self.board.each_with_index do |row, row_index|
      board_diagonal <<
      row.select do |column|
        row.index(column) == row_index
      end
    end
    board_diagonal.flatten
  end

  def self.diagonal_right(board_diagonal)
    self.board.each_with_index do |row, row_index|
      board_diagonal <<
      row.select do |column|
        row.index(column) == (row.index(row.last) - row_index)
      end
    end
    board_diagonal.flatten
  end
end
