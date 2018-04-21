class MyQueue
  def initialize
    @queue = []
  end

  def enqueue(el)
    queue << el
    el
  end

  def dequeue
    queue.shift
  end

  def show
    queue.dup
  end

  def inspect
    "#{queue}"
  end

  private
  attr_reader :queue
end
