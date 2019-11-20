class Triangle
  
  attr_accessor :equilateral, :isosceles, :scalene

  def initialize(eq, is, sc)
    @equilateral = eq
    @isosceles = is
    @scalene = sc
  end

  def kind
    
    if sides.any? { |side| side <= 0 } or ((sides[0] + sides[1]) <= sides[2])
      raise TriangleError, 'Invalid Triangle'
    else
      case sides.uniq.size
      when 1 then :equilateral
      when 2 then :isosceles
      else
        :scalene
      end
    end
    
  end
  
  def sides
    [equilateral, isosceles, scalene].sort
  end

  class TriangleError < StandardError
    def message
      "Invalid Triangle"
    end
  end
  
end
