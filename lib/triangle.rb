class Triangle
  
  attr_accessor :equilateral, :isosceles, :scalene

  def initialize(eq, is, sc)
    @equilateral = eq
    @isosceles = is
    @scalene = sc
  end

  def kind
    errors
    case sides.uniq.size
      when 1 then :equilateral
      when 2 then :isosceles
      else :scalene
    end
    
  end
  
  def sides
    [equilateral, isosceles, scalene]
  end

  class TriangleError < StandardError
    def message
      "Invalid Triangle"
    end
  end
  
end
