require 'pry'

# ====================== Pseudocode Algorithm

# 1. Inform user that he is X's and the computer is O's
# 2. Load sample gameboard with box IDs.
# 3. Coinflip to see which plays first. Inform user.
# 4. Load the gameboard and prompt user for the letter of their next play.
# 5. Repeat alternating user/computer turns until board is full, checking for winner after each turn.
# 6. Check board to see if winning conditions or tie conditions. Display winner.
#     => If indices [012,345,678,036,147,258,048,246] then winner
#     => If none, then tie
# 7. Ask user if play again or no. Exit if no.


# ====================== Method Definitions

def again? # <= nil
  yes_or_no = collect_and_validate_input("Care to play again? Y/N", :again, %w(x x x o o o x x x))
  yes_or_no == "Y" ? true : false
end # => Boolean

def collect_and_validate_input(msg, type, prev_plays) # <= String, Symbol, Array
  input = prompt msg
  
  if valid?(input, type)
    return input.upcase
  else
    system("clear")
    print_ttt_board prev_plays
    puts "INVALID INPUT: Please try again"
    input = collect_and_validate_input msg, type, prev_plays
  end
end # => String

def did_he_win?(arr, player) # <= Array, String
  if (arr[0] == arr[1] && arr[1] == arr[2] ||
      arr[3] == arr[4] && arr[4] == arr[5] ||
      arr[6] == arr[7] && arr[7] == arr[8] ||
      arr[0] == arr[3] && arr[3] == arr[6] ||
      arr[1] == arr[4] && arr[4] == arr[7] ||
      arr[2] == arr[5] && arr[5] == arr[8] ||
      arr[0] == arr[4] && arr[4] == arr[8] ||
      arr[2] == arr[4] && arr[4] == arr[6])
    true
  elsif game_over? arr
    puts "It's a TIE!"
    false
  end
end # => Boolean

def valid?(input, type) # <= String, Symbol
  if type == :play
    !(input !~ /[ABCDEFGHIabcdefghi]/) && input.length == 1
  elsif type == :again
    !(input !~ /[YNyn]/)
  end
end # => Boolean

def game_over?(arr) # <= Array
  arr.each do |x|
      return false if %w(A B C D E F G H I).include? x
  end
  true
end # => Boolean

def get_playable_indices(arr) # <= Array, String
  indices = []
  arr.each_with_index do |item, index|
      indices << index if (item != "X" && item != "O")
  end
  indices
end # => Array

def play_by_computer(plays) # <= Array 
  index_of_comp_play = get_playable_indices(plays).sample
  plays[index_of_comp_play] = "O"
  plays
end # => Array

def print_ttt_board(arr) # <= Array
  system("clear")
  puts "Let's Play Tic Tac Toe!"
  puts "-----------------------"
  puts ""
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
  puts ""
end # => nil

def play_game # <= nil
  
end # => nil

def prompt(msg) # <= String
  puts " => #{msg}"
  gets.chomp
end # => String

def update_game_plays(arr, player_choice) # <= Array, String
  here = arr.index(player_choice)
  arr[here] = "X"
  arr
end # => Array

# ====================== Main Method

begin
  game_plays = %w(A B C D E F G H I)
  
  print_ttt_board game_plays
  
  if rand(2) == 1
    # The computer wins the coinflip and plays first
    game_plays = play_by_computer game_plays
    print_ttt_board game_plays
    players_turn = true
  else
    puts "You won the coinflip and get to play first!"
    puts "\nYou have X and the computer has O\n\n"
    player_choice = collect_and_validate_input "Choose a Place to Play Your X", :play, game_plays
    game_plays = update_game_plays game_plays, player_choice
    print_ttt_board game_plays
    players_turn = false
  end
  
  while !game_over? game_plays do
    if players_turn
      player_choice = collect_and_validate_input " Your turn again!", :play, game_plays
      game_plays = update_game_plays game_plays, player_choice
      print_ttt_board game_plays
      if did_he_win? game_plays, "The Computer"
        puts " => YOU WON!!"
        break
      end
      players_turn = false
    else
      game_plays = play_by_computer game_plays
      print_ttt_board game_plays
      if did_he_win? game_plays, "You"
        puts " => Oh no! The computer wins!"
        break
      end
      players_turn = true
    end
  end 
  
  puts "Thanks for Playing!" if game_over? game_plays
end until !again?