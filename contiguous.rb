def phase_1(arr)
  max_sum = -1.0 / 0.0
  arr.each_index do |start_idx|
    (start_idx...arr.length).each do |end_idx|
      subarr = arr[start_idx..end_idx]
      sum = subarr.inject { |acc, el| acc + el }
      max_sum = sum if sum > max_sum
    end
  end
  max_sum
end
