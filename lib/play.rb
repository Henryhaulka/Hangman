require_relative 'checks'
require_relative 'player'
class Hangman
    attr_reader :player_on, :player, :word, :live, :correct_guess
    def initialize
        @player_on = Checks.new
        @player = Player.new
        @word = facts.sample
        @live = 5
        @correct_guess = []
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
     def print_teaser(guess)
            update_teaser(guess) unless guess.nil?
            puts @word_teaser
     end

     def update_teaser(guess)
       new_teaser = @word_teaser.split
       #replace blank values with letter if match in @word
       new_teaser.each_with_index do |letter,index|
           if letter == '_' && word.last[index] == guess
              new_teaser[index] = guess
           end
       end
       @word_teaser = new_teaser.join(" ")
    end

    def description
        puts "Hint: #{word.first},the answer has #{word.last.size} character "
        puts "Give the answer to the hint above,remember to put a single space between names"
        puts "** a space is a character and should be the last character to enter**"
        puts "To exit the game, type 'exit' or 'quit'"
        puts @word_teaser
    end
    

    def begin
        show
        description
        valid_move(guess = nil)
    end

    def valid_move(guess = nil)
        puts
         
        puts "Enter a letter"
        win = false
        guess = gets.chomp.downcase
       
            if word.last.include?(guess)
                puts "Correct guess!"
                print_teaser(guess)
                if @word_teaser.split.join == word.last.split.join
                    return  puts "#{player.upcase} wins!!! You are indeed a GENIUS!!!"
                end
                  valid_move
            elsif guess == "exit"|| guess == "quit" 
                puts "Good Bye #{player}, I hope to see you soon!!!"
            elsif  @live > 0 && !word.last.include?(guess)
                @live -= 1
                puts 'Wrong guess'
                puts "#{player.upcase}, you have #{live} attempts left, Try again"
                description
                valid_move
            elsif @live == 0
                puts "#{player.upcase} loses, better luck next time"
           
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
