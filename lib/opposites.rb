class Opposites
  def opposite?(*colours)
    matches = [%w(o r), %w(b g), %w(w y)]

    !!matches.include?(colours.sort)
  end
end
