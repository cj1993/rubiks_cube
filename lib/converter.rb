class Converter
  def face(face)
    sub = face[1][1]

    face.map do |row|
      row.map do |element|
        element == sub ? 'x' : '.'
      end
    end
  end

  def ribbon(ribbon, face)
    sub = face[1][1]

    ribbon.map do |row|
      row.map do |element|
        element == sub ? 'x' : '.'
      end
    end
  end
end
