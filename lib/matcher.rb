class Matcher
  def match(algorithm, pattern_orientations, converted)
    case converted
    when pattern_orientations[0]
      algorithm
    when pattern_orientations[1]
      "U " + algorithm
    when pattern_orientations[2]
      "U2 " + algorithm
    when pattern_orientations[3]
      "U' " + algorithm
    else
      'Invalid case'
    end
  end
end
