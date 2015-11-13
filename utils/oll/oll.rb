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

  def combinations
    {
      [%w(. x .), %w(. . .), %w(. x .), %w(x . x)] => [%w(. . x), %w(x x x), %w(. . x)],
      [%w(x x .), %w(. . .), %w(. x x), %w(. . .)] => [%w(. . x), %w(x x x), %w(. . x)]
    }
  end

  def algorithms
    {
      [%w(. x .), %w(. . .), %w(. x .), %w(x . x)] => "F R U R' U' F'",
      [%w(x x .), %w(. . .), %w(. x x), %w(. . .)] => "R U R' U' R' F R F'"
    }
  end
end
