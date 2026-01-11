class Player
  attr_accessor :char

  def initialize(char)
      @char = char
  end

  def to_s
    self.char.split('').last
  end
end
