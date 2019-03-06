# require './card_deck' 
require 'colorize' 

def startup  

    loop do
            puts "Welcome to the game 21!".colorize(:background => :blue)
            puts "Type #{'1'.colorize(:green)} to play"
            puts "Type #{'2'.colorize(:green)} for how to play"
            puts "To end the game simply type #{'Q'.colorize(:red)}"
 
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
                        gets.chomp
                when "Q"
                        puts "Goodbye".colorize(:red)
                        puts exit
        end
    end
end

def print_result(player, dealer)
    if player > dealer 
        puts "You Win"
    else 
        puts "You lose"
    end
end

def game
    
    cards = { "Ace" => 11, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9, "10" => 10, "Jack" => 10, "Queen" => 10, "King" => 10 }
    hits = []
    dealer_hits = []
    card1 = cards.keys.sample  
    card2 = cards.keys.sample
    card3 = cards.keys.sample  
    card4 = cards.keys.sample
    card5 = cards.keys.sample

    # Deal player 2 cards 
    hits << card1
    hits << card2 
    # Set player total hand 
    tot = hits.inject(0){|sum, key| sum + cards[key]}

    puts "Your first card is #{card1.colorize(:green)}, and your second card is #{card2.colorize(:green)}"
    # Players loop
    loop do
        puts "#{'Hit'.colorize(:cyan)} or #{'Stay'.colorize(:cyan)}"
        input = gets.chomp  

        case input
            when "hit" 
                puts hits << cards.keys.sample
                tot = hits.inject(0){|sum, key| sum + cards[key]}
                puts "Your total is: #{tot}"
                if tot == 21 
                    puts "BLACKJACK!"
                    break
                elsif tot > 21 
                    puts "Player busted. Dealer wins!".colorize(:red)
                    exit
                end
            when  "stay"
                puts hits
                puts "Your total is: #{tot}"
                break
                
            when "Q"
                puts "Goodbye".colorize(:red)
                exit
        end
    end

            

    puts "Dealers first card is "+ "#{card3}".red + ", and second card is " + "#{card4}".red
    # loop do
    dealer_hits << card3
    dealer_hits << card4
    dealer_total = dealer_hits.inject(0){|sum, key| sum + cards[key]}

    loop do
        # puts "#{'Hit'.colorize(:cyan)} or #{'Stay'.colorize(:cyan)}" 
        if dealer_total < 15 # HIT
            card = cards.keys.sample
            dealer_hits << card
            puts dealer_hits
            dealer_total = dealer_hits.inject(0){|sum, key| sum + cards[key]}
        # puts "#{'Dealers total is:'.colorize(:red)} #{dealer_total}"
        puts "Dealer hits and draws a: #{card}."
        elsif (dealer_total >= 15) && (dealer_total < 21) # STAY
            puts "#{'Dealers stands with total:'.colorize(:red)} #{dealer_total}"
            break
        elsif dealer_total == 21
            puts "Dealer BLACKJACK! You lose."
            exit
        else # BUST
            puts "Dealer busted. You win"
            exit
        end
    end
    print_result(tot, dealer_total)

end


# def total
#     dealers >> player
# end

puts startup
puts game
