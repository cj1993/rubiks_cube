class Converter
  def face(face)
    face.map do |row|
      row.map do |element|
        element == face[1][1] ? 'x' : '.'
      end
    end
  end

  def ribbon(centres, ribbon)
    ribbon.each_with_index do |row, index|
      row.map! do |element|
        element == centres[index] ? '.' : 'x'
      end
    end
  end
end
