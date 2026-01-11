class Board
  @@board = [%w[a1 a2 a3], %w[b1 b2 b3], %w[c1 c2 c3]]

  def self.display
    @@board
  end
  
  def self.play(place, player)
    @@board = @@board.map do |row|
      row.map do |column|
        if column == place
          column = player.char
        else
          column = column
        end
      end
    end
  end

  def self.column
    board_by_column = []

    for i in (0..2)
      column = []
      self.display.each do |row|
        row.each_with_index do |space, index|
          column.push(space) if index == i
        end
      end
      board_by_column.push(column)
    end

    board_by_column
  end
end
