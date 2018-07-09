class BSTNode
  attr_accessor :value
  attr_accessor :left, :right, :parent

  def initialize(value)
    @value = value
    @left, @right, @parent = nil
  end
end
