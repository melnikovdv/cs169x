class Dessert

  attr_accessor :name, :calories

  def initialize(name, calories)
    @name = name
    @calories = calories
  end
  
  def healthy?
    calories < 200
  end
  
  def delicious?
    true
  end
end

class JellyBean < Dessert
  def initialize(name, calories, flavor)
    super(name, calories)
    @flavor = flavor
  end

  def flavor
    @flavor
  end

  def flavor=(new_flavor)
    @flavor = new_flavor
  end  
  
  def delicious?
    return @flavor.eql?("black licorice") ? false : true
  end
end

d = Dessert.new("cream", 250)
puts d.delicious?
