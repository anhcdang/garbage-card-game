require 'active_record'
require_relative "player"
require_relative "play_round"
require_relative "round"
require_relative "main_methods"

require 'pry'

require "tty-prompt"

def start_game
    # Welcome ======================================================
    puts "\nWelcome to Garbage, a card game!"
    puts "\n"

    # Handle player ======================================================
    current_player = handle_player()

    # Home stats ======================================================
    menu(current_player)
end