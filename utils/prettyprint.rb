class PrettyPrint
  def face(user_input)
    puts ' _ _ _'
    user_input.each do |row|
      puts row.inject('|') { |initial, element| initial + element + '|' }
    end
    puts ' ¯ ¯ ¯'
  end

  def ribbon(user_input)
    puts " #{user_input[2][2]} #{user_input[2][1]} #{user_input[2][0]}\n#{user_input[3][0]}     #{user_input[1][2]}\n#{user_input[3][1]}     #{user_input[1][1]}\n#{user_input[3][2]}     #{user_input[1][0]}\n #{user_input[0][0]} #{user_input[0][1]} #{user_input[0][2]}"
  end

  def centres(user_input)
    puts "  #{user_input[2]}\n#{user_input[3]}   #{user_input[1]}\n  #{user_input[0]}"
  end
end
