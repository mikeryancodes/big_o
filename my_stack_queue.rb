require_relative 'stack'

class MyStackQueue
  attr_accessor :in_stack, :out_stack
  def initialize
    @in_stack = MyStack.new
    @out_stack = MyStack.new
  end

  def maximum
    [@in_stack.maximum, @out_stack.maximum].max
  end

  def minimum
    [@in_stack.minimum, @out_stack.minimum].min
  end

  def size
    @in_stack.size + @out_stack.size
  end

  def empty?
    @in_stack.empty? && @out_stack.empty?
  end

  def enqueue(new_value)
    @in_stack.push(new_value)
  end

  def dequeue
    return @out_stack.pop unless @out_stack.empty?
    while !@in_stack.empty?
      @out_stack.push(@in_stack.pop)
    end
    @out_stack.pop
  end
end
