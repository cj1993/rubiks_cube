class Matcher
  def match(index, algorithm)
    abort 'Invalid case.' unless algorithm
    case index
    when 0
      algorithm
    when 1
      "U " + algorithm
    when 2
      "U2 " + algorithm
    when 3
      "U' " + algorithm
    end
  end
end
