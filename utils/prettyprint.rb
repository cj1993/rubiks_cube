require_relative "../lib/topface"

class PrettyPrint

  def prettyPrinter(blueprint)
    puts " _ _ _"
    blueprint.each do |row|
      puts row.inject('|') { |initial, element| initial + element + "|" }
    end
    puts " ¯ ¯ ¯"
  end

end
