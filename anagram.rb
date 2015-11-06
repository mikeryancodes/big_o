def anagram(word1, word2)



end




# This is n! where n is the number of letters in the words
def first_anagram?(word)
  orig_inidices = (0...word.length).to_a
  all_poss_permutaions = orig_inidices.permutation(word.length).to_a
  all_poss_words = all_poss_permutaions.map do |inidices|
    inidices.map { |idx| word[idx] }.join
  end
  all_poss_words.include?(word)
end

#


def second_anagram?(word, word2)
  orig_inidices = (0...word.length).to_a
  all_poss_permutaions = orig_inidices.permutation(word.length).to_a
  all_poss_words = all_poss_permutaions.each do |inidices|
    new_word = inidices.map { |idx| word[idx] }.join
    return true if new_word == word2
  end
  false
end


def fourth_anagram?(word1, word2)
  return false if word1.length != word2.length
  letter_hash = Hash.new(0)
  (0...word1.length) |i| do
    letter_hash[word1[i]] += 1
    letter_hash[word2[i]] -= 1
  end
  letter_hash.values.all?{ |val| val==0 }
end
