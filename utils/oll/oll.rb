# Gets the correct OLL algorithm for a given (unique) ribbon

require_relative '../../lib/orienter'

class OLL
  def get_index(ribbon)
    orienter = Orienter.new

    orienter.ribbon(ribbon).each_with_index do |orientation, index|
      algorithms.keys.each do |key|
        @index, @key = index, key if orientation == key
      end
    end
    @index
  end

  def get_algorithm
    algorithms[@key]
  end

  private

  # algorithms hash: ribbon => algorithm
  def algorithms
    {
      [%w(. x .), %w(. . .), %w(. x .), %w(x . x)] => "F R U R' U' F'",
      [%w(x x .), %w(. . .), %w(. x x), %w(. . .)] => "R U R' U' R' F R F'"
    }
  end
end
