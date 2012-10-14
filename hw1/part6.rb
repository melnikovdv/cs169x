class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}
  def method_missing(method_id, *args)    
    if method_id.to_s == "in"
      singular_currency = args[0].to_s.gsub( /s$/, '')
      if @@currencies.has_key?(singular_currency)
        return self / @@currencies[singular_currency]
      end       
    else    
      singular_currency = method_id.to_s.gsub( /s$/, '')
      if @@currencies.has_key?(singular_currency)
        return self * @@currencies[singular_currency]
      else
        super
      end
    end
  end
end

puts 1.dollar
puts 1.dollar.in(:euro)
puts 5.rupees.in(:yen)
puts

class String
  def palindrome?
    s = self.gsub(/\W/, '').downcase
    s == s.reverse
  end
end

test_str = "Madam, I'm Adam"
puts test_str + "is a palindrome = " + test_str.palindrome?.to_s
test_str = "Ruby is nice"
puts test_str + "is a palindrome = " + test_str.palindrome?.to_s

module Enumerable
  def palindrome?    
    reverse_enum = self.reverse_each
    self.each_entry { |element|
      if (reverse_enum.next != element) then return false end    
    }
    return true
  end
end

puts
puts [1,2,3,2,1].palindrome?
