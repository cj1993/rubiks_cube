class Opposites
  def is_opposite?(*colours)
    matches = [%w(orange red), %w(blue green), %w(white yellow)]

    matches.include?(colours.sort) ? true : false
  end
end
