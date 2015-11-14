require_relative '../../lib/orienter'

class OLL
  attr_reader :orienter

  def initialize
    @orienter = Orienter.new
  end

  def index(ribbon)
    orienter.orient(ribbon).each_with_index do |orientation, index|
      algorithms.keys.each do |key|
        @index, @key = index, key if orientation == key
      end
    end
    @index
  end

  def algorithm
    algorithms[@key]
  end

  private

  def algorithms
    {
      # Cross Cases
      [%w(. . .), %w(. . x), %w(. . x), %w(. . x)] => "R' U2 R U R' U R",
      [%w(x . .), %w(. . .), %w(x . .), %w(x . .)] => "L' U R U' L U R'",
      [%w(x . .), %w(x . x), %w(. . x), %w(. . .)] => "L U' R' U L' U R U R' U R",
      [%w(. . .), %w(x . x), %w(. . .), %w(x . x)] => "R U R' U R U' R' U R U2 R'",
      [%w(. . x), %w(. . .), %w(x . .), %w(. . .)] => "R' F' L F R F' L' F",
      [%w(. . .), %w(. . .), %w(x . .), %w(. . x)] => "R' F' L' F R F' L F",
      [%w(x . x), %w(. . .), %w(. . .), %w(. . .)] => "R2 D R' U2 R D' R' U2 R'",
      # Dot Cases
      [%w(. x .), %w(x x x), %w(. x .), %w(x x x)] => "R U B' l U l2 x' U' R' F R F'",
      [%w(x x x), %w(. x x), %w(. x .), %w(x x .)] => "R' F R F' U2 R' F R y' R2 U2 R",
      [%w(. x .), %w(. x x), %w(. . x), %w(. x x)] => "y L' R2 B R' B L U2 L' B M'",
      [%w(x x .), %w(x x .), %w(. x .), %w(x x .)] => "R' U2 x R' U R U' y R' U' R' U R' F",
      [%w(. x .), %w(x x .), %w(. x .), %w(. x x)] => "R' U2 F R U R' U' y' R2 U2 x' R U",
      [%w(. x .), %w(. x .), %w(x x x), %w(. x .)] => "F R U R' U y' R' U2 R' F R F'",
      [%w(. x .), %w(. x .), %w(x x .), %w(. x x)] => "R U R' U R' F R F' U2 R' F R F'",
      [%w(. x .), %w(. x .), %w(. x .), %w(. x .)] => "M' U2 M U2 M' U M U2 M' U2 M",
      # All Corners Cases
      [%w(. x .), %w(. . .), %w(. . .), %w(. x .)] => "L' R U R' U' L R' F R F'",
      [%w(. . .), %w(. x .), %w(. x .), %w(. . .)] => "M' U' M U2 M' U' M",
      # Line Cases
      [%w(. . .), %w(x x x), %w(. . .), %w(x x x)] => "R U' y R2 D R' U2 R D' R2 d R'",
      [%w(x . .), %w(x x x), %w(. . x), %w(. x .)] => "R' U' y L' U L' y' L F L' F R",
      [%w(x x .), %w(x . x), %w(. x x), %w(. . .)] => "F U R U' R' U R U' R' F'",
      [%w(. x .), %w(x . x), %w(. x .), %w(x . x)] => "L' B' L U' R' U R U' R' U R L' B L",
      # Square Cases
      [%w(. x .), %w(x . .), %w(. . x), %w(. x .)] => "R' U2 l R U' R' U l' U2 R",
      [%w(x x .), %w(. x x), %w(. . .), %w(. . .)] => "F R' F' R U R U' R'",
      [%w(. . .), %w(. . x), %w(. x x), %w(. x x)] => "r' U2 (R U R' U) r",
      [%w(x x .), %w(x . .), %w(. . .), %w(x x .)] => "r U2 R' U' R U' r'",
      # Big L Cases
      [%w(x x .), %w(. . .), %w(x x .), %w(x . .)] => "R' F R U R' F' R y L U' L'",
      [%w(. x x), %w(. . x), %w(. x x), %w(. . .)] => "L F' L' U' L F L' y' R' U R",
      [%w(. x .), %w(x . .), %w(x x .), %w(x . .)] => "R B R' L U L' U' R B' R'",
      [%w(. x .), %w(. . x), %w(. x x), %w(. . x)] => "L' B' L R' U' R U L' B L",
      # Small L Cases
      [%w(. x x), %w(. x .), %w(x . .), %w(x . x)] => "F R U R' U' R U R' U' F'",
      [%w(x x .), %w(x . x), %w(. . x), %w(. x .)] => "F' L' U' L U L' U' L U F",
      [%w(. . x), %w(. . .), %w(x x .), %w(x x x)] => "L U' y' R' U2 R' U R U' R U2 R d' L'",
      [%w(. x x), %w(. . .), %w(x . .), %w(x x x)] => "R' F R' F' R2 U2 x' U' R U R'",
      [%w(x x x), %w(. . .), %w(x . x), %w(. x .)] => "R' F R F' U2 R2 y R' F' R F'",
      [%w(x x x), %w(. x .), %w(x . x), %w(. . .)] => "L F' L' F U2 L2 y' L F L' F",
      [%w(. x x), %w(. x x), %w(. . x), %w(. . .)] => "L F R' F R F2 L'",
      [%w(x . .), %w(x x .), %w(x x .), %w(. . .)] => "L' B' L U' R' U R L' B L",
      [%w(x . .), %w(. x .), %w(x x .), %w(x . .)] => "U2 r R2 U' R U' R' U2 R U' M",
      [%w(. . x), %w(. . x), %w(. x x), %w(. x .)] => "U2 l' L2 U L' U L U2 L' U M",
      [%w(. . .), %w(x x .), %w(. x .), %w(. . x)] => "x' U' R U' R2 F x R U R' U' R B2",
      [%w(x x .), %w(. x .), %w(x . .), %w(x . .)] => "R' U' R y' x' R U' R' F R U R'",
      [%w(. . x), %w(. x .), %w(. x x), %w(. . x)] => "R U R' y R' F R U' R' F' R",
      [%w(. . .), %w(x . .), %w(. x .), %w(x x .)] => "R2 U R' B R U' R2 U l U l'",
      [%w(. x .), %w(. x .), %w(x . x), %w(. . x)] => "U' R U2 R' U' R U' R2 y' R' U' R U B",
      [%w(. x .), %w(. . .), %w(x . x), %w(. x .)] => "U' R' U2 R U R' U R2 y R U R' U' F'",
      # M Cases
      [%w(. . .), %w(x x x), %w(. . .), %w(. x .)] => "R U x' R U' R' U x U' R'",
      [%w(. x .), %w(. . x), %w(. x .), %w(x . .)] => "R U R' U' x D' R' U R E'",
      # P Cases
      [%w(. x x), %w(. x .), %w(x . .), %w(. . .)] => "L d R' d' L' U L F L'",
      [%w(x x .), %w(. . .), %w(. . x), %w(. x .)] => "R' d' L d R U' R' F' R",
      [%w(. x .), %w(x x x), %w(. . .), %w(. . .)] => "F U R U' R' F'",
      [%w(. x .), %w(. . .), %w(. . .), %w(x x x)] => "F' U' L' U L F",
      # T Cases
      [%w(. x .), %w(. . .), %w(. x .), %w(x . x)] => "F R U R' U' F'",
      [%w(x x .), %w(. . .), %w(. x x), %w(. . .)] => "R U R' U' R' F R F'",
      # W Cases
      [%w(. . x), %w(. . .), %w(. x .), %w(x x .)] => "L U L' U L U' L' U' y2 R' F R F'",
      [%W(X . .), %W(. X X), %W(. X .), %W(. . .)] => "R' U' R U' R' U R U y F R' F' R",
      # Z Cases
      [%w(. x .), %w(. . .), %w(x x .), %w(. . x)] => "R' F R U R' U' y L' d R",
      [%w(. x .), %w(x . .), %w(. x x), %w(. . .)] => "L F' L' U' L U y' R d' L'"
    }
  end
end
