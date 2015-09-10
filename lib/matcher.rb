# Returns algorithms correctly for any given face orientation

class Matcher
  def match(index, algorithm)
    case index
    when 0
      algorithm
    when 1
      "U " + algorithm
    when 2
      "U2 " + algorithm
    when 3
      "U' " + algorithm
    else
      'Invalid case'
    end
  end
end
