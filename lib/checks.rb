class Checks
  def name_check(player)
    player.size >= 3
  end

  def valid_game
    gamer = false
    until gamer
      puts 'Input a valid name'
      @player = gets.chomp
      gamer = name_check(@player)
      return @player if gamer

      puts 'name should be at least 3 letters' unless gamer
    end
  end
end
