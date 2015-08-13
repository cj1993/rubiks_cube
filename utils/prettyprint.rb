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
    blueprint[2].reverse.each { |x| print " #{x}" }
    print "\n"
    [blueprint[3], blueprint[1]].transpose.each {|x| puts "#{x[0]}     #{x[1]}"}
    blueprint[0].each { |x| print " #{x}" }
  end
end
