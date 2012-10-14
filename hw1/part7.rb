class CartesianProduct
  include Enumerable

  def initialize(seq1 , seq2)
  	@cp = Array.new  	
  	seq1.each { |el1|
		seq2.each { |el2|
			@cp.push [el1,el2]
		}
  	}
  end

  def each(&block)
  	@cp.each(&block)	
  end 
end

c = CartesianProduct.new([:a,:b], [4,5])
c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]

c = CartesianProduct.new([:a,:b], [])
c.each { |elt| puts elt.inspect }
# Nothing printed since Cartesian product of anything with an empty collection is empty

# x = [1,2,3]
# puts x.to_s
# x.send :[]=,0,2
# puts x.to_s
# x[0] + x.[](1) + x.send(:[],2)
# puts $1

# puts
# movies = [%q{"Aladdin",   "G"},
#               %q{"I, Robot", "PG-13"},
#               %q{"Star Wars","PG"}]
# # regexp = /"([^"]+)",\s*"([^"]+)"/
# # regexp = /"(.*)",\s*"(.*)"/
# # regexp = /"(.*)", "(.*)"/
# regexp = /(.*),\s*(.*)/
# movies.each do |movie|
#       movie.match(regexp)
#       title,rating = $1,$2
#       puts title, rating
#     end

# puts

# class C

# end

# class B < C

# end

# class A < B

# end

# a = A.new
# b = B.new
# c = C.new

# puts b.respond_to?('class')
# puts A.superclass == B
# puts a.class.ancestors.include?(C)

# puts 

# class Book
# 	attr_accessor :author
# 	attr_reader :title
# 	attr_accessor :comments
# 	def initialize(author, title)
# 	  @author = author
# 	  @title = title
# 	  @comments = []
# 	end

# 	# class_eval %Q{
# 	# 	def #{comments}=(comments)
			

# 	#         @#{comments} << "#{book.title} was a good book"	        
# 	#     end
#  #    }   
# end

# puts book = Book.new("Chuck Palahniuk", "Fight Club")
# puts book.author
# book.author = "mdv"
# puts book.author
# puts 
# puts book.title

# # book.comments.each { |comment| puts comment }
# puts "asdasdasdasd"
# book.comments << "#{book.title} was a good book"
# puts book.comments.to_s

# puts 
# s = "Hello: I`m a l33t programmer!!"
# r = s.split(/[^a-zA-Z]/)
# puts r.to_s
# r = r.reject{|e| e == "I" || e.empty?}
# puts r.to_s
# puts

# def mystery_sequence(start1, start2, limit=4)
#   yield start1
#   yield start2
#   nextval = start1 + start2
#   1.upto(limit) do
#     yield nextval
#     nextval, start2 = nextval + start2, nextval
#   end
# end

# s = []
# mystery_sequence(2,3) do |elt| ; s<<elt; end
# # mystery_sequence(2,3).each do |elt| ; s<<elt; end
# # mystery_sequence(2,3).do |elt| ; s<<elt; end
# # mystery_sequence.each(2,3) do |elt| ; s<<elt; end
# puts s.to_s
