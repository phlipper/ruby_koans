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
  if [a, b, c].any? { |n| n < 1 }
    raise TriangleError, "sides must have a length greater than zero"
  end

  if (a >= b + c) || (b >= a + c) || (c >= a + b)
    raise TriangleError, "a side cannot be greater than the sum of the other two"
  end

  if (a == b && b == c)  # all sides equal
    :equilateral
  elsif (a == b || b == c || a == c)  # two sides equal
    :isosceles
  else
    :scalene  # no sides equal
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
