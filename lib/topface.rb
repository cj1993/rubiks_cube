class TopFace
  def top_face
    top_face = Array.new(3, Array.new(3))

    top_face.map! do |row|
      row.map do
        gets.chomp
      end
    end
  end
end
