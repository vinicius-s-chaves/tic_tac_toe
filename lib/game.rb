class Game
  @@board = [%w[a1 a2 a3], %w[b1 b2 b3], %w[c1 c2 c3]]

  def self.board
    @@board.each do |row|
      row
    end
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
end
