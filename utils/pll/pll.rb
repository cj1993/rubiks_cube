require_relative '../../lib/orienter'

class PLL
  def index(ribbon)
    orienter = Orienter.new

    orienter.ribbon(ribbon).each_with_index do |orientation, index|
      unique_ribbon_algorithms.keys.each do |key|
        @index, @key = index, key if orientation == key
      end
    end
    @index
  end

  def algorithm
    unique_ribbon_algorithms[@key] || 'Invalid case'
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
      [%w(. . x), %w(x x x), %w(x . .), %w(. x .)] => "R U R' U' R' F R2 U' R' U' R U R' F'"  # T
      # [%w(. . x), %w(x x x), %w(x . .), %w(. x .)] => "",  # V
      # [%w(. . x), %w(x x x), %w(x . .), %w(. x .)] => ""   # Y
    }
  end

  def non_unique_ribbon_algorithms
    {
      [%w(. . x), %w(x x x), %w(x . .), %w(. x .)] => "",  # AA
      [%w(. . x), %w(x x x), %w(x . .), %w(. x .)] => "",  # AB
      [%w(x . .), %w(. x x), %w(x x x), %w(x x x)] => "R2' u R' U R' U' R u' R2 F' U F",       # GA
      [%w(x . .), %w(. x x), %w(x x x), %w(x x x)] => "F' U' F R2 u R' U R U' R u' R2",        # GB
      [%w(. . x), %w(x x x), %w(x . .), %w(. x .)] => "",  # GC
      [%w(. . x), %w(x x x), %w(x . .), %w(. x .)] => "",  # GD
      [%w(. . x), %w(x x x), %w(x . .), %w(. x .)] => "",  # UA
      [%w(. . x), %w(x x x), %w(x . .), %w(. x .)] => "",  # UB
      [%w(. . x), %w(x x x), %w(x . .), %w(. x .)] => "",  # H
      [%w(. . x), %w(x x x), %w(x . .), %w(. x .)] => ""   # Z
    }
  end
end
