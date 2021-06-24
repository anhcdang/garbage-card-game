require "tty-prompt"

class PlayerHand

    attr_accessor :cards, :deck, :round_won, :player

    def initialize(deck, player)
        @deck = deck
        @cards = []
        @player = player
        10.times do 
            @cards.append(deck.remove_card)
        end
        # deck.players << self
        @round_won = false
    end
    
    def make_move

        card = deck.remove_card

        while card do

            if card != nil
                card %= 13
            else
                return true
            end

            if card == 0
                
                prompt = TTY::Prompt.new
                
                i = 0
                available_spots = []
                while i < 10 do
                    if @cards[i] != nil
                        available_spots << i + 1
                    end
                    i += 1
                end
                puts "You pulled a wild card!"
                location = prompt.select("Choose a spot to fill with your wild card:", available_spots)
                
                card = swap_cards(location)
                
                if complete_hand?(@cards)
                    win
                end

            elsif card == 11 || card == 12
                return true

            else
                card = swap_cards(card)
                if complete_hand?(@cards)
                    win
                end
            end

        end

    end

    private

    def swap_cards(new)
        temp = @cards[new - 1]
        @cards[new - 1] = nil
        new = temp
        return new
    end

    def complete_hand?(array)
        array.uniq.size <= 1
    end

    def win
        @round_won = true
    end

end