class TopFace
  def face
    face = Array.new(3, Array.new(3))

    face.map! do |row|
      row.map! { gets.chomp }
    end
  end
end
