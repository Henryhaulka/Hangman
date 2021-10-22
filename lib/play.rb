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
        @word_teaser = ""
        word.last.size.times do
                @word_teaser += "_ "
        end
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
     def print_teaser(last_guess = nil)
       update_teaser(last_guess) unless last_guess.nil?
        puts @word_teaser
    end

     def update_teaser(last_guess)
       new_teaser = @word_teaser.split
       #replace blank values with letter if match in @word
       new_teaser.each_with_index do |letter,index|
           if letter == '_' && word.last[index] == last_guess
              new_teaser[index] = last_guess
           end
       end
       @word_teaser = new_teaser.join(" ")
    end

    def begin
            show
            puts "Hint: #{word.first},the answer has #{word.last.size} character "
            puts "Give the answer to the hint above,remember to put a single space between names"
            puts "** a space is a character"
            puts @word_teaser
            valid_move    
    end

    def valid_move(guess = nil)
        puts
        puts "Enter a letter"
        guess = gets.chomp
            if word.last.include?(guess)
                puts "Correct guess!"
                print_teaser(guess)
                p correct_guess << guess
                 @letters.delete(guess)
                 
                  valid_move
            elsif  @live > 0 && !word.last.include?(guess)
                @live -= 1
                puts 'Wrong guess'
                puts "#{player}, you have #{live} attempts left, Try again"
                puts "Hint: #{word.first},the answer has #{word.last.size} character "
                puts "Give the answer to the hint above,remember to put a single space between names"
                valid_move
            elsif @live == 0
                puts "You lose, better luck next time"
            end
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
