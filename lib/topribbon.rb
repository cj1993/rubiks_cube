# Returns 4x3 array filled with user input for their cube ribbon

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
