require_relative 'lib/topface'
require_relative 'lib/topribbon'
require_relative 'lib/converter'
require_relative 'lib/orienter'
require_relative 'lib/matcher'
require_relative 'utils/oll/ta'
require_relative 'utils/oll/tb'
require_relative 'utils/prettyprint'

class App
  def app
    topface = TopFace.new
    # topribbon = TopRibbon.new
    ta = TA.new
    # tb = TB.new
    prettyprint = PrettyPrint.new
    converter = Converter.new
    orienter = Orienter.new
    matcher = Matcher.new

    puts 'Rubiks cube top layer solver ~ (CFOP : OLL + PLL)'
    puts '... white = w, yellow = y, blue = b, green = g, red = r, orange = o ...'

    top_flag = ribbon_flag = true

    while top_flag
      puts "Enter the top face of your cube, from left to right, top to bottom\n"

      top_face = topface.face

      prettyprint.face(top_face)

      puts 'Is this pattern correct (y/n)?'
      top_flag = gets.chomp.downcase

      top_flag = top_flag == 'y' ? false : true
    end

    # while ribbon_flag
    #   TODO
    #   puts "\n\n"
    #
    #   top_ribbon = topribbon.ribbon
    #
    #   prettyprint.ribbon(top_ribbon)
    #
    #   puts "\nIs this pattern correct (y/n)?"
    #   ribbon_flag = gets.chomp.downcase
    #
    #   ribbon_flag = ribbon_flag == 'y' ? false : true
    # end

    # converted_face = converter.face(top_face)
    # converted_ribbon = converter.ribbon(top_ribbon, top_face)

    # puts matcher.oll(ta.algorithm, orienter.faces(ta.face), converted_face)


  end
end

App.new.app
