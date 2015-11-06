require_relative 'my_stack_queue'

def windowed_max_range(array, window_size)
  max_range = -1.0 / 0.0
  stack_queue = MyStackQueue.new
  window_size.times do |i|
    stack_queue.enqueue(array[i])
  end

  (window_size...array.size).each do |index_of_next_element|
    current_range = stack_queue.maximum - stack_queue.minimum
    max_range = current_range if current_range > max_range
    stack_queue.dequeue
    stack_queue.enqueue(array[index_of_next_element])
  end

  current_range = stack_queue.maximum - stack_queue.minimum
  max_range = current_range if current_range > max_range

  max_range
end
