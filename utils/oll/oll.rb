class OLL
  def combinations(face, ribbon)
    combinations = {
      [%w(. x .), %w(. . .), %w(. x .), %w(x . x)] => [%w(. . x), %w(x x x), %w(. . x)],
      [%w(x x .), %w(. . .), %w(. x x), %w(. . .)] => [%w(. . x), %w(x x x), %w(. . x)]
    }

    algorithms = {
      [%w(. x .), %w(. . .), %w(. x .), %w(x . x)] => "F R U R' U' F'",
      [%w(x x .), %w(. . .), %w(. x x), %w(. . .)] => "R U R' U' R' F R F'"
    }

    combinations[ribbon] == face ? algorithms[ribbon] : 'Invalid case'
  end
end
