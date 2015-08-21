require_relative '../prettyprint'

class TA
  def face
    [%w(. . x), %w(x x x), %w(. . x)]
  end

  def ribbon
    [%w(. x .), %w(. . .), %w(. x .), %w(x . x)]
  end

  def algorithm
    "F R U R' U' F'"
  end
end
