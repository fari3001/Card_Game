# require './card_deck' #allows to use another file with the ruby gem of card deck illastrations
require 'colorize'  #ruby gem to allow for colorization




def startup     #Displays the welcome message an options for playing and rules
loop do
    puts "Welcome to the game 21!".colorize(:background => :blue)
   puts "To end the game simply type #{'Q'.colorize(:red)}"
   puts "Type #{'1'.colorize(:green)} to play"
   puts "Type #{'2'.colorize(:green)} for how to play"

   

# def howto_play      #lets the user input 1/2 for either playing or how to play game and quitting.

   input = gets.chomp

   case input
   when  "1"
    system("clear")
       puts "Let's play!"
       break
   when  "2"
        puts "How to Play: The object of the game is to get as close to 21 as possible.
        - You start off with 2 cards.
        - Type 'Hit' for another card.
        - Type 'Stay' to leave the amount you have.
        - If you go over 21 then you are bust.
        - You are playing against the dealer.
        - Hit enter to proceed"
        # system("Clear")
        gets.chomp
   when "Q"
       puts "Goodbye".colorize(:red)
       puts exit
   end
end
end

def player
     #all the cards available to play


#    card4 = cards.sample
#    card5 = cards.sample



#cards = %i{ace 2 3 4 5 6 7 8 9 10 jack queen king}
cards = { "ace" => 11, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9, "10" => 10, "jack" => 10, "queen" => 10, "king" => 10 }
hits = []

card1 = cards.keys.sample  #Displays a random card
card2 = cards.keys.sample
# card3 = cards.sample




puts "Your first card is #{card1.colorize(:green)}, and your second card is #{card2.colorize(:green)}"
loop do
puts "#{'Hit'.colorize(:cyan)} or #{'Stay'.colorize(:cyan)}"

input = gets.chomp  #Allows user to input hit or stay

case input
when "hit"    #if user write hit then will display another random card
   puts hits << cards.keys.sample
   #cards.sample.colorize(:green)
when  "stay"
   hits << card1
   hits << card2
    puts hits.inject(0){|sum, key| sum + cards[key]}
    #reduce :+ {hits |key, value| }




   #"Staying put" 
   break
when "Q"
   puts "Goodbye".colorize(:red)
   puts exit
end
end
end

# def total

# end

puts startup
# puts howto_play
puts player
# puts total