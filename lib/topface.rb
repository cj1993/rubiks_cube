# Returns 3x3 array filled with user input for their cube face

class TopFace
  def face
    face = Array.new(3, Array.new(3))

    face.map! do |row|
      row.map do
        gets.chomp
      end
    end
  end
end
