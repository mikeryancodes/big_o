def my_min_1(array)
  minimum = nil
  array.each do |element|
    is_smaller_than_everything_else = true
    array.each do |element_2|
      if element > element_2
        is_smaller_than_everything_else = false
      end
    end
    minimum = element if is_smaller_than_everything_else
  end

  minimum
end

def my_min_2(array)
  minimum = 1.0 / 0.0
  array.each do |element|
    minimum = element if element < minimum
  end

  minimum
end

if __FILE__ == $PROGRAM_NAME

  test_array = Array.new(1_000){5000 - rand(10_001)}

  t1 = Time.now
  first_result = my_min_1(test_array)
  t2 = Time.now
  second_result = my_min_2(test_array)
  t3 = Time.now

  puts "First result was #{first_result} and the time was #{t2 - t1}."
  puts "Second result was #{second_result} and the time was #{t3 - t2}."
end
