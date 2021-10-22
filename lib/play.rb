require_relative 'checks'
require_relative 'player'
class Hangman
    attr_reader :player_on, :player, :word, :live
    attr_accessor :correct_guess
    def initialize
        @player_on = Checks.new
        @player = Player.new
        @word = facts.sample
        @live = 5
        @correct_guess = []
        @letters = ('a'..'z').to_a
    end

    def facts
        [
            ["Richest Footballer in the world", "Faiq Bolkiah".downcase],
            ["Highest Footballer goal soccer in the world", "Cristiano Ronaldo".downcase],
            ["Tallest Footballer in the world", "Simon Bloch".downcase],
            ["Footballer with most trophies in the world", "Dani Alves".downcase],
            ["Football club with most trophies in the world", "Al Ahly".downcase]
        ]
    end 
    
    def begin
            show
            puts "Hint: #{word.first},the answer has #{word.last.size} character "
            puts "Give the answer to the hint above,remember to put a single space between names"
            puts "** a space is a character"
            word_teaser
            valid_move        
    end

    def valid_move
        puts
        puts "Enter a letter"
        guess = gets.chomp
            if word.last.include?(guess)
                puts "Correct guess!"
            p correct_guess << guess
            elsif  @live > 0 && !word.last.include?(guess)
                @live -= 1
                puts 'Wrong guess'
                puts "#{player}, you have #{live} attempts left, Try again"
                valid_move
            elsif @live == 0
                puts "You lose, better luck next time"
            end
    end
    

    def word_teaser
        word_teaser = ""
        word.last.size.times do
                word_teaser += "_ "
        end
        puts word_teaser
    end
    

    def welcome
        puts "Welcome to Hangman, where Football lovers can guess football facts"
        puts "You will be given a clue of the legend's achievement or characteristics"
        @player = player_on.valid_game 
    end

    def show
        welcome
        puts "Your name has been saved as #{player.upcase}"
        puts
    end
    
end
