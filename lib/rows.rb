class Rows
  def get_row(array, row_num)
    array[row_num] if array.is_a?(Array) && row_num.is_a?(Integer)
  end
end
