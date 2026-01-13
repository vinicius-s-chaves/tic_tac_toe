class Player
  attr_accessor :char, :name

  def initialize(char, name)
      @char = char
      @name = name
  end

  def to_s
    self.char.split('').last
  end
end
