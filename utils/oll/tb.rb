require_relative '../prettyprint'

class TB
  def face_pattern
    [%w(. . x), %w(x x x), %w(. . x)]
  end

  def ribbon_pattern
    [%w(x x .), %w(. . .), %w(. x x), %w(. . .)]
  end

  def algorithm
    "R U R' U' R' F R F'"
  end
end
