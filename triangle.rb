# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  validateTriangleSides(a, b, c)
  if a == b and b == c
    return :equilateral
  elsif a == b || b == c || a == c
    return :isosceles
  else
    return :scalene	
  end	
end

def validateTriangleSides(a, b, c) 
  if isNonPositive(a) || isNonPositive(b) || isNonPositive(c)
    raise TriangleError, "No side of a triangle can be zero or a negative number"
  elsif isSumOfTwoGreaterThanAnyOtherSide(a, b, c)
    raise TriangleError, "The sum of any two sides of a triangle should be greater than the length of the third side"
  end
end

def isNonPositive(x)
  x <= 0
end  

def isSumOfTwoGreaterThanAnyOtherSide(a, b, c)  
  a + b <= c || a + c <= b || b + c <= a
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
