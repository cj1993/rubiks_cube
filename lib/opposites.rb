class Opposites
  def opposite?(*colours)
    matches = [%w(w y), %w(b g), %w(o r)]

    !!matches.include?(colours.sort)
  end
end
