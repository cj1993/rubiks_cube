class Converter
  def convert(face, ribbon = nil)
    @sub = face[1][1]
    ribbon ? mappings!(ribbon) : mappings!(face)
  end

  private

  def mappings!(arg)
    arg.map do |row|
      row.map do |element|
        element == @sub ? 'x' : '.'
      end
    end
  end
end
