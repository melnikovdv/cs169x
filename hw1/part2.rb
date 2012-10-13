class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

class Player	

	def initialize(name, strategy)
		@name = name
		@strategy = strategy		
	end
	
	def to_s
		return "name: " + @name + "; strategy = " + @strategy 
	end 

	def beat?(player)
		if @strategy.eql?("R")
			if player.strategy.eql?("R")
				return false
			elsif player.strategy.eql?("P")
				return false
			elsif player.strategy.eql?("S")
				return true
			end
		elsif @strategy.eql?("P")  
			if player.strategy.eql?("R")
				return true
			elsif player.strategy.eql?("P")
				return false
			elsif player.strategy.eql?("S")
				return false
			end
		elsif @strategy.eql?("S")		
			if player.strategy.eql?("R")
				return false
			elsif player.strategy.eql?("P")
				return true
			elsif player.strategy.eql?("S")
				return false
			end
		end
	end

	def list
		return [@name, @strategy]
	end

	attr_reader :name, :strategy
end

def rps_result(m1, m2)
  # YOUR CODE HERE
end

def rps_game_winner(game)

	rps_input_check(game)
	p1 = Player.new(game[0][0], game[0][1])
	p2 = Player.new(game[1][0], game[1][1])

	if p1.beat?(p2)
		puts p1.name + " would win since " + p1.strategy + " > " + p2.strategy
		return p1.list
	elsif p2.beat?(p1)
		puts p2.name + " would win since " + p2.strategy + " > " + p1.strategy
		return p2.list
	elsif (p1.beat?(p2) == false) and (p2.beat?(p1) == false )
		puts "deuce since " + p1.strategy + " = " + p2.strategy	+ " but the first wins accroding to the rules"
		return p1.list
	end		

end

def rps_input_check(game) 	
	raise WrongNumberOfPlayersError unless game.length == 2
	
	game.each { | player |		
		b = false
		["R", "P", "S"].each { | strategy |
			b = player[1].upcase.eql?(strategy)
			if b 
				break
			end
		}

		raise NoSuchStrategyError unless b		
	}
end

def rps_tournament_winner(tournament)
	winners = Array.new				
	rps_make_participants(tournament, winners);		
			
	while winners.length != 1 do					
		pairs = rps_make_pairs(winners)			
		
		winners = Array.new		
		pairs.each { | pair |
			player = rps_game_winner(pair)
			winners.push(player)			
		}		
	end	
	puts "Champion is " + winners[0][0]
	return winners[0]
end

def rps_make_participants(nestedLists, resultArr)			
	if (nestedLists.length == 2) and (nestedLists[0].class != Array)
		pair = Array.new
		pair.push(nestedLists[0])
		pair.push(nestedLists[1])
		resultArr.push(pair)		
	else 
		nestedLists.each { | list | 
			rps_make_participants(list, resultArr)
		}		
	end
end

def rps_make_pairs(winners) 	
	pairs = Array.new	
	w1, w2 = nil	

	winners.each { | winner |				
		if w1 == nil 
			w1 = winner						
		elsif w2 == nil
			w2 = winner						

			pair = Array.new
			pair.push(w1)
			pair.push(w2)
			pairs.push(pair)
			w1, w2 = nil					
		end		
	}	
	return pairs	
end

puts "game winner"
puts "==========="
game = [ ["Dave", "P"], ["Armando", "S"] ]
puts rps_game_winner(game)
puts

puts "tournament from 2 participants"
puts "=============================="
tournament = [ ["Armando", "P"], ["Dave", "S"] ]
rps_tournament_winner(tournament)
puts

puts "tournament from 8 participants"
puts "=============================="
tournament = [
    [
        [ ["Armando", "P"], ["Dave", "S"] ],
        [ ["Richard", "R"],  ["Michael", "S"] ],
    ],
    [
        [ ["Allen", "S"], ["Omer", "P"] ],
        [ ["David E.", "R"], ["Richard X.", "P"] ]
    ]
]
rps_tournament_winner(tournament)
