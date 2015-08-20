require_relative '../lib/topface'

class PrettyPrint
  def pretty_print_face(blueprint)
    puts ' _ _ _'
    blueprint.each do |row|
      puts row.inject('|') { |initial, element| initial + element + '|' }
    end
    puts ' ¯ ¯ ¯'
  end

  def pretty_print_ribbon(blueprint)
    puts " #{blueprint[2][2]} #{blueprint[2][1]} #{blueprint[2][0]}\n#{blueprint[3][0]}     #{blueprint[1][2]}\n#{blueprint[3][1]}     #{blueprint[1][1]}\n#{blueprint[3][2]}     #{blueprint[1][0]}\n #{blueprint[0][0]} #{blueprint[0][1]} #{blueprint[0][2]}"
  end
end
