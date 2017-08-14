class Space

  attr_accessor :mark, :value

  def initialize
    @mark = " "
    @value = 0
  end

  def mark_x
    self.mark = "X"
    self.value = 1
  end

  def mark_o
    self.mark = "O"
    self.value = -1
  end

end
