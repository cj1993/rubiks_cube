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
      [%w(x x .), %w(x x .), %w(. x .), %w(x x .)] => "f R U R' U' f' U F R U R' U' F'",
      [%w(. x .), %w(. x x), %w(. x x), %w(. x x)] => "f R U R' U' f' U' F R U R' U' F'",
      [%w(. x x), %w(. x .), %w(x x .), %w(x x x)] => "F R U R' U' F' f R U R' U' f'",
      [%w(. x .), %w(x x x), %w(. x .), %w(x x x)] => "R U2 R' R' F R F' U2 R' F R F'",
      [%w(. x .), %w(x x .), %w(. x .), %w(. x x)] => "M U R U R' U' M' R' F R F' ",
      [%w(. x .), %w(. x .), %w(x x .), %w(. x x)] => "R U R' U R' F R F' U2 R' F R F'",
      [%w(. x .), %w(. x .), %w(x x x), %w(. x .)] => "F R U R' U F' y' U2 ",
      [%w(. x .), %w(. x .), %w(. x .), %w(. x .)] => "M U R U R' U' M2 U R U' r'",
      # All Corners Cases
      [%w(. x .), %w(. . .), %w(. x .), %w(. . .)] => "R U R' U' M' U R U' r'",
      [%w(. . .), %w(. . .), %w(. x .), %w(. x .)] => "M' U M U2 M' U M",
      # Line Cases
      [%w(. x x), %w(. . .), %w(x x .), %w(x . x)] => "f R U R' U' f'",
      [%w(. x .), %w(x . x), %w(. x .), %w(x . x)] => "F R U R' U' R F' r U R' U' r'",
      [%w(x . .), %w(x x x), %w(. . x), %w(. x .)] => "R U R' U R d' R U' R' F'",
      [%w(. . .), %w(x x x), %w(. . .), %w(x x x)] => "R' U2 R2 U R' U R U2 x' U' R' U",
      # Square Cases
      [%w(. . .), %w(. . x), %w(. x x), %w(. x x)] => "r' U2 R U R' U r",
      [%w(x x .), %w(x . .), %w(. . .), %w(x x .)] => "r U2 R' U' R U' r'",
      [%w(x . .), %w(. . x), %w(. x .), %w(. x .)] => "R U2 R' R' F R F' R U2 R'",
      [%w(x x .), %w(. x x), %w(. . .), %w(. . .)] => "F R U' R' U' R U R' F'",
      # Big L Cases
      [%w(x x .), %w(x . .), %w(. x .), %w(x . .)] => "r U r' R U R' U' r U' r'",
      [%w(. x x), %w(. . x), %w(. x .), %w(. . x)] => "l' U' l L' U' L U l' U l",
      [%w(. x x), %w(. . x), %w(. x x), %w(. . .)] => "F U R U' R2 F' R U R U' R'",
      [%w(x x .), %w(. . .), %w(x x .), %w(x . .)] => "R' F R U R' F' R y' R U' R'",
      # Small L Cases
      [%w(. x x), %w(. x .), %w(x . .), %w(x . x)] => "F R U R' U' R U R' U' F'",
      [%w(x x .), %w(x . x), %w(. . x), %w(. x .)] => "F' L' U' L U L' U' L U F",
      [%w(x . .), %w(x . .), %w(. x .), %w(x x .)] => "F' L' U' L U L' U' L U F",
      [%w(. . x), %w(. x x), %w(. x .), %w(. . x)] => "F' L' U' L U F y F R U R' U' F'",
      [%w(. x x), %w(. . .), %w(x . .), %w(x x x)] => "R' F R' F' R2 U2 y R' F R F'",
      [%w(. x x), %w(. x x), %w(. . x), %w(. . .)] => "r U R' U R U2 r'",
      [%w(. x .), %w(. x .), %w(. . .), %w(x . x)] => "R' F R F' R' F R F' R U R' U' R U R'",
      [%w(. x .), %w(. x .), %w(x . x), %w(. . .)] => "R U R' U R U2 R' F R U R' U' F'",
      [%w(. x .), %w(x . x), %w(. . .), %w(x x x)] => "r U R' U R U' R' U R U2 r'",
      [%w(. . .), %w(x . x), %w(. x .), %w(x x x)] => "r' U' R U' R' U R U' R' U2 r",
      [%w(x . .), %w(x x .), %w(x x .), %w(. . .)] => "r' U' R U' R' U2 r",
      [%w(x x .), %w(x x x), %w(. . x), %w(. . .)] => "R' F R2 B' R2 F' R2 B R'",
      [%w(x x .), %w(. x .), %w(. . x), %w(. . .)] => "R U R' U' R U' R' F' U' F R U R'",
      [%w(. . .), %w(x . .), %w(. x .), %w(. x x)] => "R2 U R' B' R U' R2 U R B R'",
      [%w(x x .), %w(. x .), %w(x . .), %w(x . .)] => "R U R' U' R' F R2 U R' U' F'",
      [%w(. . x), %w(. x .), %w(. x x), %w(. . x)] => "R U R' U R' F R F' R U2 R'",
      # M Cases
      [%w(. . .), %w(x x x), %w(. . .), %w(. x .)] => "R' U' R' F R F' U R",
      [%w(. x .), %w(. . x), %w(. x .), %w(x . .)] => "R U R2 U' R' F R U R U' F'",
      # P Cases
      [%w(. . .), %w(. . .), %w(. x .), %w(x x x)] => "f R U R' U' f'",
      [%w(. . .), %w(x x x), %w(. x .), %w(. . .)] => "f' L' U' L U f",
      [%w(x . .), %w(. . .), %w(x x .), %w(. x .)] => "R d L' d' R' U R B R'",
      [%w(x x .), %w(. . .), %w(. . x), %w(. x .)] => "R' U' F U R U' R' F' R",
      # T Cases
      [%w(. x .), %w(. . .), %w(. x .), %w(x . x)] => "F R U R' U' F'",
      [%w(x x .), %w(. . .), %w(. x x), %w(. . .)] => "R U R' U' R' F R F'",
      # W Cases
      [%w(. x .), %w(x x .), %w(. . x), %w(. . .)] => "R U R' U R U' R' U' R' F R F'",
      [%w(. x .), %w(. . .), %w(x . .), %w(. x x)] => "L' U' L U' L' U L U L F' L' F",
      # Z Cases
      [%w(. x ,), %w(. . .), %w(x x .), %w(. . x)] => "R' F R U R' U' F' U R",
      [%w(. x x), %w(. . .), %w(. x .), %w(x . .)] => "R B' R' U' R U B U' R' "
    }
  end
end
