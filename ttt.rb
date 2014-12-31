require 'pry'

# ====================== Pseudocode Algorithm

# 1. Inform user that he is X's and the computer is O's
# 2. Load sample gameboard with box numbers.
# 3. Coinflip to see which plays first. Inform user.
# 4. Load the gameboard and prompt user for the number of their next play.
# 5. Repeat alternating user/computer turns until board is full.
# 6. Check board to see if winning conditions or tie conditions. Display winner.
#     => If [123,456,789,147,258,369,159,357] then winner
#     => If none, then tie
# 7. Ask user if play again or no. Exit if no.


# ====================== Method Definitions

def collect_and_validate_input(msg, type) # <= String, Symbol
  input = prompt msg
  
  if valid?(input, type)
    return input.upcase
  else
    system("clear")
    puts "INVALID INPUT: Please try again"
    input = collect_and_validate_input msg, type
  end
end # => String

def valid?(input, type) # <= String, Symbol
  if type == :play
    !(input !~ /[ABCDEFGHIabcdefghi]/) && input.length == 1
  elsif type == :again
    !(input !~ /[YNyn]/)
  end
end # => Boolean

def display_header # <= nil
  system("clear")
  puts "Let's Play Tic Tac Toe!"
  puts "-----------------------"
end # => nil

def get_indices(arr, el) # <= Array, String
  indices = []
  arr.each_with_index do |item, index|
      indices << index if item == el
  end
  indices
end # => Array

def play_by_computer(plays) # <= Array 
  index_of_comp_play = get_indices(plays,"n").sample
  plays[index_of_comp_play] = "O"
  plays
end # => Array

def print_ttt(arr) # <= Array
  puts "     |     |     "
  puts "  #{arr[0]}  |  #{arr[1]}  |  #{arr[2]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{arr[3]}  |  #{arr[4]}  |  #{arr[5]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{arr[6]}  |  #{arr[7]}  |  #{arr[8]}  "
  puts "     |     |     "
end # => nil

def prompt(msg) # <= String
  puts " => #{msg}"
  gets.chomp
end # => String

def update_game_plays(arr, player_choice) # <= Array
  here = arr.index(player_choice)
  arr[here] = "X"
  arr
end # => Array


# ====================== Game Logic

game_plays = %w(A B C D E F G H I)

display_header
puts "You have X and the computer has O\n\n"
print_ttt game_plays

if rand(2) == 1
  # computer wins coinflip and plays first
  game_plays = play_by_computer game_plays
else
  # player plays first
  player_choice = collect_and_validate_input "Choose a Place to Play Your X", :play
  game_plays = update_game_plays game_plays, player_choice
end