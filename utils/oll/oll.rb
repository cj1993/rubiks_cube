# TODO Class documentation

class OLL
  # TODO - method name not indicative of what method does
  def combinations(face, ribbon)

    # combinations hash: ribbon => face
    combinations = {
      [%w(. x .), %w(. . .), %w(. x .), %w(x . x)] => [%w(. . x), %w(x x x), %w(. . x)],
      [%w(x x .), %w(. . .), %w(. x x), %w(. . .)] => [%w(. . x), %w(x x x), %w(. . x)]
    }

    # algorithms hash: ribbon => algorithms
    algorithms = {
      [%w(. x .), %w(. . .), %w(. x .), %w(x . x)] => "F R U R' U' F'",
      [%w(x x .), %w(. . .), %w(. x x), %w(. . .)] => "R U R' U' R' F R F'"
    }

    combinations[ribbon] == face ? algorithms[ribbon] : 'Invalid case'
  end
end
