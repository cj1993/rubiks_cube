require_relative '../centres'
require_relative '../converter'
require_relative '../matcher'
require_relative '../topface'
require_relative '../topribbon'

require_relative '../../utils/oll/oll'
require_relative '../../utils/pll/pll'
require_relative '../../utils/prettyprint'

class Cube
  attr_reader :centres, :converter, :matcher, :topface, :topribbon, :prettyprint, :oll, :pll

  def initialize
    puts "Rubiks cube last layer solver!\n\n"
    puts "Use : white = w, yellow = y, blue = b, green = g, orange = o, red = r\n\n"

    @centres_flag = @face_flag = @ribbon_flag = true

    @centres     = Centres.new
    @converter   = Converter.new
    @matcher     = Matcher.new
    @topface     = TopFace.new
    @topribbon   = TopRibbon.new
    @prettyprint = PrettyPrint.new
    @oll         = OLL.new
    @pll         = PLL.new
  end

  def get_centres
    while @centres_flag
      puts "Centres\n\n"
      x_y_centres = centres.x_y_centres
      prettyprint.centres(x_y_centres)
      puts "\nIs this pattern correct (y/n)?\n"
      @centres_flag = gets.chomp.downcase
      @centres_flag = !(@centres_flag == 'y')
    end
    x_y_centres
  end

  def get_face
    while @face_flag
      puts "Face\n\n"
      top_face = topface.face
      prettyprint.face(top_face)
      puts "\nIs this pattern correct (y/n)?\n"
      @face_flag = gets.chomp.downcase
      @face_flag = !(@face_flag == 'y')
    end
    top_face
  end

  def get_ribbon
    while @ribbon_flag
      puts "Ribbon\n\n"
      top_ribbon = topribbon.ribbon
      prettyprint.ribbon(top_ribbon)
      puts "\nIs this pattern correct (y/n)?\n"
      @ribbon_flag = gets.chomp.downcase
      @ribbon_flag = !(@ribbon_flag == 'y')
    end
    top_ribbon
  end

  def convert(ribbon, arg)
    converter.convert(ribbon, arg)
  end

  def oll_index(converted_ribbon)
    oll.index(converted_ribbon)
  end

  def oll_algorithm
    oll.algorithm
  end

  def pll_index
    pll.index
  end

  def pll_algorithm(converted_ribbon)
    pll.algorithm(converted_ribbon)
  end

  def solve(index, algorithm)
    matcher.match(index, algorithm)
  end
end
