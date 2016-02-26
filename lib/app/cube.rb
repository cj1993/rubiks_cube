Dir["./utils/**/*.rb"].each { |file| require file }

require_relative '../centres'
require_relative '../converter'
require_relative '../matcher'
require_relative '../topface'
require_relative '../topribbon'

class Cube
  attr_reader :centres, :converter, :matcher, :topface, :topribbon, :prettyprint, :oll, :pll

  def initialize
    puts "Rubiks cube last layer solver!\n\n"
    puts "Use : white = w, yellow = y, blue = b, green = g, orange = o, red = r\n\n"

    @centres     = Centres.new
    @converter   = Converter.new
    @matcher     = Matcher.new
    @topface     = TopFace.new
    @topribbon   = TopRibbon.new
    @prettyprint = PrettyPrint.new
    @oll         = OLL.new
    @pll         = PLL.new(converter)
  end

  def get_centres
    while true
      puts "\n\nCentres\n\n"
      x_y_centres = centres.x_y_centres
      prettyprint.centres(x_y_centres)
      break if flag?
    end
    x_y_centres
  end

  def get_face
    while true
      puts "\n\nFace\n\n"
      top_face = topface.face
      prettyprint.face(top_face)
      break if flag?
    end
    top_face
  end

  def get_ribbon
    while true
      puts "\n\nRibbon\n\n"
      top_ribbon = topribbon.ribbon
      prettyprint.ribbon(top_ribbon)
      break if flag?
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

  private

  def flag?
    puts "\nIs this pattern correct (y/n)?\n"
    gets.chomp.downcase == 'y'
  end
end
