class TopRibbon
  def top_ribbon
    top_face = Array.new(4, Array.new(3))

    top_face.map! do |row|
      row.map do
        gets.chomp
      end
    end
  end
end
