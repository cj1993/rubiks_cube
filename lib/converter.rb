class Converter
  def convert(ribbon, arg)
    mappings!(ribbon, arg)
  end

  private

  def mappings!(ribbon, arg)
    ribbon.map.with_index do |row, index|
      row.map do |element|
        if arg.length == 3
          element == arg[1][1] ? 'x' : '.'
        else
          element == arg[index] ? '.' : 'x'
        end
      end
    end
  end
end
