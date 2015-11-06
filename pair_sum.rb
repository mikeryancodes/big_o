def pair_sum?(arr, target)
  h = Hash.new(false)
  arr.each do |element|
    pair = target - element
    if h[pair]
      return true
    else
      h[element] = true
    end
  end

  false
end
