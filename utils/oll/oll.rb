# TODO Class documentation

class OLL

  # TODO - method name not indicative of what method does
  def tmp(face, ribbon)
    combinations[ribbon] == face ? algorithms[ribbon] : 'Invalid case'
  end

  private

  # combinations hash: ribbon => face
  def combinations
    {
      [%w(. x .), %w(. . .), %w(. x .), %w(x . x)] => [%w(. . x), %w(x x x), %w(. . x)],
      [%w(x x .), %w(. . .), %w(. x x), %w(. . .)] => [%w(. . x), %w(x x x), %w(. . x)]
    }
  end

  # algorithms hash: ribbon => algorithm
  def algorithms
    {
      [%w(. x .), %w(. . .), %w(. x .), %w(x . x)] => "F R U R' U' F'",
      [%w(x x .), %w(. . .), %w(. x x), %w(. . .)] => "R U R' U' R' F R F'"
    }
  end
end
