require_relative "player"
require_relative "play_round"
require_relative "round"
require_relative "main_methods"

require 'pry'

require "tty-prompt"

# Welcome ======================================================
puts "Welcome to Garbage, a card game!"
puts "\n"
binding.pry
# Handle player ======================================================
current_player = handle_player()

# Home ======================================================
menu(current_player)

