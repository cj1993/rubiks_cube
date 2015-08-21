require_relative 'lib/topface'
require_relative 'lib/topribbon'
require_relative 'lib/rows'
require_relative 'lib/converter'
require_relative 'lib/orienter'
require_relative 'lib/matcher'
require_relative 'utils/oll/ta'
require_relative 'utils/oll/tb'
require_relative 'utils/prettyprint'

class App
  def app
    tf = TopFace.new
    tr = TopRibbon.new
    ta = TA.new
    # tb = TB.new
    pp = PrettyPrint.new
    # r = Rows.new
    c = Converter.new
    o = Orienter.new
    m = Matcher.new

    puts 'Rubiks cube top layer solver ~ (CFOP : OLL + PLL)'
    puts '... white = w, yellow = y, blue = b, green = g, red = r, orange = o ...'

    top_flag = ribbon_flag = true

    while top_flag
      puts "Enter the top face of your cube, from left to right, top to bottom\n"

      top_face = tf.top_face

      pp.pretty_print_face(top_face)

      puts 'Is this pattern correct (y/n)?'
      top_flag = gets.chomp.downcase

      top_flag = top_flag == 'y' ? false : true
    end

    # while ribbon_flag
    #   puts "\nEnter the ribbon of your cube, from the front face rotating clockwise, 1/4 turn each time\n"
    #
    #   top_ribbon = tr.top_ribbon
    #
    #   pp.pretty_print_ribbon(top_ribbon)
    #
    #   puts "\nIs this pattern correct (y/n)?"
    #   ribbon_flag = gets.chomp.downcase
    #
    #   ribbon_flag = ribbon_flag == 'y' ? false : true
    # end

    converted_face = c.top_face_converter(top_face)
    # converted_ribbon = c.top_ribbon_converter(top_ribbon, top_face)

    puts m.oll_matcher(ta.algorithm, o.face_orientations(ta.face_pattern), converted_face)
  end
end

App.new.app
