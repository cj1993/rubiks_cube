class Converter
  def top_face_converter(top_face)
    sub = top_face[1][1]

    top_face.map do |i|
      i.map do |j|
        j == sub ? 'x' : '.'
      end
    end
  end

  def top_ribbon_converter(top_ribbon, top_face)
    sub = top_face[1][1]

    top_ribbon.map do |i|
      i.map do |j|
        j == sub ? 'x' : '.'
      end
    end
  end
end
