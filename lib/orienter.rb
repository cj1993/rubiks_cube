class Orienter
  def faces(pattern)
    [
      pattern,
      pattern.transpose.reverse,
      pattern.flatten.reverse.each_slice(3).to_a,
      pattern.reverse.transpose
    ]
  end
end
