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
