def combine_anagrams(words)

	anagrams = Array.new

	words.each { |word| 		
		wasAdded = false		
		anagrams.each { |anagram| 						
			if anagram[0].downcase.chars.sort.eql?(word.downcase.chars.sort)
				anagram.push(word)
				wasAdded = true
			end		
		}
		if !wasAdded
			anagrams.push(Array.new.push(word))
		end
	}
	
	i = 1
	anagrams.each { |anagram| 		
		puts "anagram group " + i.to_s + ": "		
		puts anagram		
		i += 1
		puts
	}
	return anagrams
end

words = ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']
combine_anagrams(words)
