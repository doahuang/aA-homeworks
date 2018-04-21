class Stack
  def initialize
    @stack = []
  end

  def add(el)
    stack << el
    el
  end

  def remove
    stack.pop
  end

  def show
    stack.dup
  end

  def inspect
    "#{stack}"
  end

  private
  attr_reader :stack
end
