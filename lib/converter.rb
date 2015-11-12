require_relative 'orienter'

class Converter
  attr_reader :orienter

  def initialize
    @orienter = Orienter.new
  end

  def convert(ribbon, arg)
    mappings!(ribbon, arg)
  end

  def get_index
    @@index
  end

  private

  def mappings!(ribbon, arg)
    if arg.length == 4
      @@index  = pll_match(ribbon, arg).values.first
      ribbon   = pll_match(ribbon, arg).keys.first
    end

    ribbon.map.with_index do |row, index|
      row.map do |element|
        if arg.length == 3
          element == arg[1][1] ? 'x' : '.'
        else
          element == arg[index] ? '.' : 'x'
        end
      end
    end
  end

  def pll_match(ribbon, arg)
    matches = { 0 => 0, 1 => 0, 2 => 0, 3 => 0 }
    orientations = orienter.orient(ribbon)

    orientations.each_with_index do |orientation, outer_index|
      orientation.each_with_index do |row, inner_index|
        row.each do |element|
          matches[outer_index] += 1 if element == arg[inner_index]
        end
      end
    end

    match = matches.max_by { |_, v| v }
    { orientations[match[0]] => match[0] }
  end
end
