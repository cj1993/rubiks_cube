class Matcher
  def match(index, algorithm)
    abort 'Invalid case.' unless algorithm
    case index
    when 0
      algorithm
    when 1
      optimise_match(index, algorithm.split)
    when 2
      optimise_match(index, algorithm.split)
    when 3
      optimise_match(index, algorithm.split)
    end
  end

  private

  def optimise_match(index, alg)
    case index
    when 1
      return "U2 " + alg.drop(1).join(' ') if alg.first == "U"
      return "U' " + alg.drop(1).join(' ') if alg.first == "U2"
      return alg.drop(1).join(' ')         if alg.first == "U'"
      return "U "  + alg.join(' ')
    when 2
      return "U "  + alg.drop(1).join(' ') if alg.first == "U'"
      return "U' " + alg.drop(1).join(' ') if alg.first == "U"
      return alg.drop(1).join(' ')         if alg.first == "U2"
      return "U2 " + alg.join(' ')
    when 3
      return "U "  + alg.drop(1).join(' ') if alg.first == "U2"
      return "U2 " + alg.drop(1).join(' ') if alg.first == "U'"
      return alg.drop(1).join(' ')         if alg.first == "U"
      return "U' " + alg.join(' ')
    end
  end
end
