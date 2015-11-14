require_relative '../../lib/converter'
require_relative '../../lib/orienter'

class PLL
  attr_reader :converter, :orienter

  def initialize(converter)
    @converter = converter
    @orienter  = Orienter.new
  end

  def index
    converter.get_index
  end

  def algorithm(ribbon)
    orienter.orient(ribbon).each do |orientation|
      unique_ribbon_algorithms.keys.each do |key|
        @key = key if orientation == key
      end
    end
    unique_ribbon_algorithms[@key]
  end

  private

  def unique_ribbon_algorithms
    {
      [%w(x . x), %w(x . x), %w(x . x), %w(x . x)] => "x' R U' R' D R U R' D' R U R' D R U' R' D'",            # E
      [%w(. x x), %w(x . x), %w(x x .), %w(. . .)] => "R' U' F' R U R' U' R' F R2 U' R' U' R U R' U R",        # F
      [%w(. . .), %w(. . x), %w(x x x), %w(x x .)] => "R' U L' U2 R U' R' U2 L R U'",                          # JA
      [%w(. x x), %w(x x x), %w(x . .), %w(. . .)] => "R U R' F' R U R' U' R' F R2 U' R' U'",                  # JB
      [%w(x . .), %w(. x x), %w(x . .), %w(. x x)] => "R U R' U R U R' F' R U R' U' R' F R2 U' R' U2 R U' R'", # NA
      [%w(. . x), %w(x x .), %w(. . x), %w(x x .)] => "R' U R U' R' F' U' F R U R' F R' F' R U' R",            # NB
      [%w(. . x), %w(x . x), %w(x x .), %w(. x .)] => "R U' R' U' R U R D R' U' R D' R' U2 R' U'",             # RA
      [%w(. x .), %w(. x x), %w(x . x), %w(x . .)] => "R' U2 R U2 R' F R U R' U' R' F' R2 U'",                 # RB
      [%w(. . x), %w(x x .), %w(. x x), %w(x . .)] => "R U R' U' R' F R2 U' R' U' R U R' F'",                  # T
      [%w(. . x), %w(x x .), %w(. x x), %w(x . .)] => "R' U R' d' R' F' R2 U' R' U R' F R F",                  # V
      [%w(. . x), %w(x . .), %w(. x x), %w(x x .)] => "F R U' R' U' R U R' F' R U R' U' R' F R F'"             # Y
    }
  end

  def non_unique_ribbon_algorithms
    {
      [%w(. . x), %w(x . x), %w(x . x), %w(x . .)] => "x R' U R' D2 R U' R' D2 R2",     # AA
      [%w(. . x), %w(x . x), %w(x . x), %w(x . .)] => "x R2 D2 R U R' D2 R U' R",       # AB
      [%w(x . .), %w(. x x), %w(x x x), %w(x x x)] => "R2 u R' U R' U' R u' R2 F' U F", # GA
      [%w(x . .), %w(. x x), %w(x x x), %w(x x x)] => "F' U' F R2 u R' U R U' R u' R2", # GB
      [%w(. . x), %w(x x x), %w(x . .), %w(. x .)] => "R2 u' R U' R U R' u R2 f R' f'", # GC
      [%w(. . x), %w(x x x), %w(x . .), %w(. x .)] => "f R f' R2 u' R U' R' U R' u R2", # GD
      [%w(. x .), %w(. x .), %w(. . .), %w(. x .)] => "R U' R U R U R U' R' U' R2",     # UA
      [%w(. x .), %w(. x .), %w(. . .), %w(. x .)] => "R2 U R U R' U' R' U' R' U R'",   # UB
      [%w(. x .), %w(. x .), %w(. x .), %w(. x .)] => "M2 U M2 U2 M2 U M2",             # H
      [%w(. x .), %w(. x .), %w(. x .), %w(. x .)] => "M2 U M2 U M' U2 M2 U2 M' U2"     # Z
    }
  end
end
