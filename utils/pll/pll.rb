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
      # [%w(. . x), %w(x x x), %w(x . .), %w(. x .)] => "",  # E
      # [%w(. . x), %w(x x x), %w(x . .), %w(. x .)] => "",  # F
      # [%w(. . x), %w(x x x), %w(x . .), %w(. x .)] => "",  # JA
      # [%w(. . x), %w(x x x), %w(x . .), %w(. x .)] => "",  # JB
      # [%w(. . x), %w(x x x), %w(x . .), %w(. x .)] => "",  # NA
      # [%w(. . x), %w(x x x), %w(x . .), %w(. x .)] => "",  # NB
      # [%w(. . x), %w(x x x), %w(x . .), %w(. x .)] => "",  # RA
      # [%w(. . x), %w(x x x), %w(x . .), %w(. x .)] => "",  # RB
      [%w(. . x), %w(x x x), %w(x . .), %w(. x .)] => "R U R' U' R' F R2 U' R' U' R U R' F'",      # T
      # [%w(. . x), %w(x x x), %w(x . .), %w(. x .)] => "",  # V
      [%w(. . x), %w(x . .), %w(. x x), %w(x x .)] => "F R U' R' U' R U R' F' R U R' U' R' F R F'" # Y
    }
  end

  def non_unique_ribbon_algorithms
    {
      # [%w(. . x), %w(x x x), %w(x . .), %w(. x .)] => "",  # AA
      # [%w(. . x), %w(x x x), %w(x . .), %w(. x .)] => "",  # AB
      [%w(x . .), %w(. x x), %w(x x x), %w(x x x)] => "R2' u R' U R' U' R u' R2 F' U F", # GA
      [%w(x . .), %w(. x x), %w(x x x), %w(x x x)] => "F' U' F R2 u R' U R U' R u' R2"   # GB
      # [%w(. . x), %w(x x x), %w(x . .), %w(. x .)] => "",  # GC
      # [%w(. . x), %w(x x x), %w(x . .), %w(. x .)] => "",  # GD
      # [%w(. . x), %w(x x x), %w(x . .), %w(. x .)] => "",  # UA
      # [%w(. . x), %w(x x x), %w(x . .), %w(. x .)] => "",  # UB
      # [%w(. . x), %w(x x x), %w(x . .), %w(. x .)] => "",  # H
      # [%w(. . x), %w(x x x), %w(x . .), %w(. x .)] => ""   # Z
    }
  end
end
