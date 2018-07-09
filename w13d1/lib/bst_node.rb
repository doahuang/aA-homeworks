class BSTNode
  attr_accessor :value, :left, :right, :parent
  def initialize(value)
    @value = value
    @left, @right, @parent = nil
  end
end
