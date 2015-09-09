# Takes user input to form an array of the centre colours
# but excludes the top and bottom centre colours

class Centres
  def x_y_centres
    x_y_centres = Array.new(4)

    x_y_centres.map! { gets.chomp }
  end
end
