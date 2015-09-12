require_relative 'lib/centres'
require_relative 'lib/converter'
require_relative 'lib/matcher'
require_relative 'lib/orienter'
require_relative 'lib/topface'
require_relative 'lib/topribbon'

require_relative 'utils/oll/oll'
require_relative 'utils/pll/pll'
require_relative 'utils/prettyprint'

class App
  def app
    centres = Centres.new
    converter = Converter.new
    matcher = Matcher.new
    topface = TopFace.new
    topribbon = TopRibbon.new

    prettyprint = PrettyPrint.new

    oll = OLL.new
    pll = PLL.new

    # puts 'Rubiks cube top layer solver ~ (CFOP : OLL + PLL)'
    # puts '... white = w, yellow = y, blue = b, green = g, red = r, orange = o ...'

    centres_flag = face_flag = ribbon_flag = true

    # while centres_flag
    #   puts "Centres\n\n"
    #
    #   x_y_centres = centres.x_y_centres
    #
    #   prettyprint.centres(x_y_centres)
    #
    #   puts "\nIs this pattern correct (y/n)?\n"
    #   centres_flag = gets.chomp.downcase
    #
    #   centres_flag = !(centres_flag == 'y')
    # end

    while face_flag
      puts "Face\n\n"

      top_face = topface.face

      prettyprint.face(top_face)

      puts 'Is this pattern correct (y/n)?'
      face_flag = gets.chomp.downcase

      face_flag = !(face_flag == 'y')
    end

    while ribbon_flag
      puts "Ribbon\n\n"

      top_ribbon = topribbon.ribbon

      prettyprint.ribbon(top_ribbon)

      puts "\nIs this pattern correct (y/n)?\n"
      ribbon_flag = gets.chomp.downcase

      ribbon_flag = !(ribbon_flag == 'y')
    end

    converted_face = converter.convert(top_face)
    converted_ribbon = converter.convert(top_face, top_ribbon)


    # print converted_face
    # puts "\n"
    # print converted_ribbon

    # oll_index = oll.index(converted_ribbon)
    # oll_algorithm = oll.algorithm

    # pll_index = pll.index(converted_ribbon)
    # pll_algorithm = pll.algorithm

    # puts matcher.match(oll_index, oll_algorithm)
    # puts matcher.match(pll_index, pll_algorithm)
  end
end

App.new.app
