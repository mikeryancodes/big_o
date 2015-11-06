require 'byebug'


class MyStack < Array
  def initialize
    @store = []
    @size = 0
  end

  def pop
    @size -= 1
    @store.pop[:value]
  end

  def minimum
    if @store.empty?
      return 1.0 / 0.0
    end
    peek[:minimum_including_item]
  end

  def maximum
    if @store.empty?
      return -1.0 / 0.0
    end
    peek[:maximum_including_item]
  end

  def push(new_value)
    if empty?
      min = new_value
      max = new_value
    else
      min = peek[:minimum_including_item]
      max = peek[:maximum_including_item]

      if new_value < min
        min = new_value
      end

      if new_value > max
        max = new_value
      end
    end

    new_entry = {:value => new_value,
                 :minimum_including_item => min,
                 :maximum_including_item => max}
    @size += 1
    @store.push(new_entry)
  end

  def peek
    @store.last
  end

  def size
    @size
  end

  def empty?
    @size == 0
  end
end

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

if __FILE__ == $PROGRAM_NAME
  q = MyStackQueue.new
  q.enqueue(5)
  q.enqueue(-4)
  debugger
  q_min = q.minimum
end
