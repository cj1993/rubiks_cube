require_relative "../prettyprint"

class T

  def pattern
    pattern = Array.new(3, Array.new(3))

    pattern[0][0] = "."
    pattern[0][1] = "."
    pattern[0][2] = "X"
    pattern[1][0] = "X"
    pattern[1][1] = "X"
    pattern[1][2] = "X"
    pattern[2][0] = "."
    pattern[2][1] = "."
    pattern[2][2] = "X"
  end

  def algorithm
    "F R U R' U' F'"
  end

end
