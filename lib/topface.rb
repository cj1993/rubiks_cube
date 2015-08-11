class TopFace

  def topFace
    top_face = Array.new(3, Array.new(3))

    top_face.map! do |row|
      row.map do |element|
        element = gets.chomp
      end
    end
  end

end
