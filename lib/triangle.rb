class Triangle
  
  attr_accessor :equilateral, :isosceles, :scalene

  def initialize(eq, is, sc)
    @equilateral = eq
    @isosceles = is
    @scalene = sc
    errors
  end

  def kind
    case sides.uniq.size
      when 1 then :equilateral
      when 2 then :isosceles
      else :scalene
    end
    
  end
  
  def sides
    [equilateral, isosceles, scalene]
  end
  
  def errors
    if sides.any? { |side| side <= 0 } or sides[0] + sides[1] <= sides[2]
      begin 
        raise TriangleError
      rescue TriangleError => err
        err.message
      end
    end
  end
  
  class TriangleError < StandardError
    def message
      "Invalid Triangle"
    end
  end
  
end

Triangle.new(0, 0, 0).kind