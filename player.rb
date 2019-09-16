class Player
  LIVES = 3

  attr_reader :name
  attr_accessor :lives

  def initialize(name)
    @name = name
    @lives = LIVES
  end  

  def lose_life
    @lives-=1
  end

end