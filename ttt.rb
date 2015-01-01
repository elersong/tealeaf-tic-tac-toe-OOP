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

def ai_choose_play_index(arr) # <= Array
    # horizontals
    hor = [[0,1,2], [3,4,5], [6,7,8]]
    hor.each do |group|
        return find_third_index group, arr if !nil?
    end
    
    # verticals
    ver = [[0,3,6], [1,4,7], [2,5,8]]
    ver.each do |group|
        return find_third_index group, arr if !nil?
    end
    
    # diagonals
    dia = [[0,4,8], [2,4,6]]
    dia.each do |group|
        return find_third_index group, arr if !nil?
    end
    
    nil
end # => Integer or nil

def find_third_index(group_arr, plays_arr) # <= Array
    available_index = []
    two_os = []
    group_arr.each do |index|
        if plays_arr[index] == "X"
            two_os << index
        elsif %w(A B C D E F G H I).include? plays_arr[index]
            available_index << index
        end
    end
    binding.pry
    if two_os.count == 2 && available_index == 1
        return available_index[0]
    end
    nil
end # => Integer or nil

def again? # <= nil
  yes_or_no = collect_and_validate_input("Care to play again? Y/N", :again, [])
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
  # look for a quick win first
  index_to_win = ai_choose_play_index plays, "O"
  
  # look for ways the opponent can win
  index_to_block = ai_choose_play_index plays, "X"
  
  if index_to_win.nil? && index_to_block.nil?
    index_of_comp_play = get_playable_indices(plays).sample
    plays[index_of_comp_play] = "O"
    return plays
  elsif index_to_win.nil?
    plays[index_to_block] = "O"
    return plays
  else
    plays[index_to_win] = "O"
    plays
  end
end # => Array

def ai_choose_play_index(arr, cursor) # <= Array
  # horizontals
  hor = [[0,1,2], [3,4,5], [6,7,8]]
  hor.each do |group|
    found = find_third_index group, arr, cursor
    return found if found != nil
  end
    
  # verticals
  ver = [[0,3,6], [1,4,7], [2,5,8]]
  ver.each do |group|
    found = find_third_index group, arr, cursor
    return found if found != nil
  end
  
  # diagonals
  dia = [[0,4,8], [2,4,6]]
  dia.each do |group|
    found = find_third_index group, arr, cursor
    return found if found != nil
  end
  
  nil
end # => Integer or nil

def find_third_index(group_arr, plays_arr, cursor) # <= Array
  available_index = []
  two_os = []
  group_arr.each do |index|
    if plays_arr[index] == cursor
      two_os << index
    elsif %w(A B C D E F G H I).include? plays_arr[index]
      available_index << index
    end
  end
  if two_os.count == 2 && available_index.count == 1
    return available_index[0]
  end
  nil
end # => Integer or nil

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

def prompt(msg) # <= String
  puts " => #{msg}"
  gets.chomp
end # => String

def update_game_plays(arr, player_choice) # <= Array, String
  here = arr.index(player_choice)
  arr[here] = "X"
  arr
end # => Array

# ====================== Game Logic

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
      player_choice = collect_and_validate_input " Your turn!", :play, game_plays
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
  
end until !again?
puts "Thanks for Playing!"