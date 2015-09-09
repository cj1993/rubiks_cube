# Returns a boolean on whether or not a pair of colours are opposite,
# this is only correct for default European colour schemes

class Opposites
  def is_opposite?(*colours)
    matches = [%w(orange red), %w(blue green), %w(white yellow)]

    !!matches.include?(colours.sort)
  end
end
