class TopRibbon
  def ribbon
    ribbon = Array.new(4, Array.new(3))

    ribbon.map! do |row|
      row.map do
        gets.chomp
      end
    end
  end
end
