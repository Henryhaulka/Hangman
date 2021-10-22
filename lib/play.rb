require_relative 'checks'
require_relative 'player'
class Hangman
    attr_reader :player_on, :player
    def initialize
        @player_on = Checks.new
        @player = Player.new
    end

    def welcome
        puts "Welcome to Hangman, where Football lovers can guess football legends name"
        puts "You will be given a clue of the legend's achievement or characteristics"
        return @player = player_on.valid_game 
    end

    def show
        welcome
        puts "Your name has been saved as #{@player.upcase}"
    end
    
    
end
