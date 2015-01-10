require 'pry'

# ============================================================================== Pseudocode Algorithm

# 1. Inform user that he is X's and the computer is O's
# 2. Load sample gameboard with box IDs.
# 3. Coinflip to see which plays first. Inform user.
# 4. Load the gameboard and prompt user for the letter of their next play.
# 5. Repeat alternating user/computer turns until board is full, checking for
#    winner after each turn.
# 6. Check board to see if winning conditions or tie conditions. Display winner.
#     => If indices [012,345,678,036,147,258,048,246] then winner
#     => If none, then tie
# 7. Ask user if play again or no. Exit if no.


# ============================================================================== Class Definitions

class Board
  
  def self.print_ttt_board(arr) # <= Array
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
  
end

class AI
  
  def self.play_by_computer(plays) # <= GameEngine.game_plays Array 
    # look for a quick win first
    index_to_win = AI.ai_choose_play_index plays, "O"
    
    # look for ways the opponent can win
    index_to_block = AI.ai_choose_play_index plays, "X"
    
    if index_to_win
       plays[index_to_win] = "O"
       return plays
    elsif index_to_block
       plays[index_to_block] = "O"
       plays
    else
       index_of_comp_play = AI.get_playable_indices(plays).sample
       plays[index_of_comp_play] = "O"
       return plays
    end
  end # => Array
  
  private
  
  def self.get_playable_indices(arr) # <= Array, String
    indices = []
    arr.each_with_index do |item, index|
        indices << index if (item != "X" && item != "O")
    end
    indices
  end # => Array
  
  def self.ai_choose_play_index(arr, cursor) # <= Array
    order = ["D", "H", "V"].shuffle
  
    order.each do |operation| # shuffle the hierarchy of how the AI thinks. more like playing a human... but a jedi human.
      case operation
        when "D"
          # diagonals
          dia = [[0,4,8], [2,4,6]]
          dia.each do |group|
            found = AI.find_third_index group, arr, cursor
            return found if found != nil
          end
        when "H"
          # horizontals
          hor = [[0,1,2], [3,4,5], [6,7,8]]
          hor.each do |group|
            found = AI.find_third_index group, arr, cursor
            return found if found != nil
          end
        when "V"
          # verticals
          ver = [[0,3,6], [1,4,7], [2,5,8]]
          ver.each do |group|
            found = AI.find_third_index group, arr, cursor
            return found if found != nil
          end
      end
    end
    nil
  end # => Integer or nil
  
  def self.find_third_index(group_arr, plays_arr, cursor) # <= Array
    available_index = []
    two_os = []
    group_arr.each do |index|
      if plays_arr[index] == cursor
        two_os << index
      elsif %w(1 2 3 4 5 6 7 8 9).include? plays_arr[index]
        available_index << index
      end
    end
    if two_os.count == 2 && available_index.count == 1
      return available_index[0]
    end
    nil
  end # => Integer or nil
end

class GameEngine
  
  attr_accessor :players_turn
  
  def initialize
    @players_turn = nil
    @game_plays = %w(1 2 3 4 5 6 7 8 9)
    first_play_of_game
  end
  
  def update_game_plays(player_choice) # <= @game_plays Array, String
    here = @game_plays.index(player_choice)
    @game_plays[here] = "X"
    @game_plays
  end # => Array
  
  def game_over? # <= @game_plays Array
    @game_plays.each do |x|
        return false if %w(1 2 3 4 5 6 7 8 9).include? x
    end
    true
  end # => Boolean
  
  def first_play_of_game
    Board.print_ttt_board @game_plays
    
    if rand(2) == 1
      # The computer wins the coinflip and plays first
      @game_plays = AI.play_by_computer @game_plays
      Board.print_ttt_board @game_plays
      @players_turn = true
    else
      puts "You won the coinflip and get to play first!"
      puts "\nYou have X and the computer has O\n\n"
      player_choice = Player.collect_and_validate_input "Choose a Place to Play Your X", :play, @game_plays
      update_game_plays player_choice
      Board.print_ttt_board @game_plays
      @players_turn = false
    end
  end
  
  def did_he_win?(arr) # <= Array, String
    if (arr[0] == arr[1] && arr[1] == arr[2] ||
        arr[3] == arr[4] && arr[4] == arr[5] ||
        arr[6] == arr[7] && arr[7] == arr[8] ||
        arr[0] == arr[3] && arr[3] == arr[6] ||
        arr[1] == arr[4] && arr[4] == arr[7] ||
        arr[2] == arr[5] && arr[5] == arr[8] ||
        arr[0] == arr[4] && arr[4] == arr[8] ||
        arr[2] == arr[4] && arr[4] == arr[6])
      true
    elsif game_over?
      puts "It's a TIE!"
      false
    end
  end # => Boolean
  
  def player_take_turn
    gameover = false
    player_choice = Player.collect_and_validate_input " Your turn!", :play, @game_plays
    update_game_plays player_choice
    Board.print_ttt_board @game_plays
    if did_he_win? @game_plays
      puts " => YOU WON!!"
      gameover = true
    end
    @players_turn = false unless gameover == true
    gameover
  end # => Boolean
  
  def computer_take_turn
    gameover = false
    @game_plays = AI.play_by_computer @game_plays
    Board.print_ttt_board @game_plays
    if did_he_win? @game_plays
      puts " => Oh no! The computer wins!"
      gameover = true
    end
    @players_turn = true unless gameover == true
    gameover
  end # => Boolean
  
  def again? # <= nil
    yes_or_no = Player.collect_and_validate_input("Care to play again? Y/N", :again, %w(o o o x x x o o o))
    yes_or_no == "Y"
  end # => Boolean
end

class Player
  
  def self.collect_and_validate_input(msg, type, prev_plays) # <= String, Symbol, Array
    input = Player.prompt msg
    
    if Player.valid?(input, type)
      return input.upcase
    else
      system("clear")
      print_ttt_board prev_plays
      puts "INVALID INPUT: Please try again"
      input = collect_and_validate_input msg, type, prev_plays
    end
  end # => String
  
  private
  
  def self.valid?(input, type) # <= String, Symbol
    if type == :play
      input =~ /[123456789]/ && input.length == 1
    elsif type == :again
      input =~ /[YNyn]/
    end
  end # => Boolean
  
  def self.prompt(msg) # <= String
    puts " => #{msg}"
    gets.chomp
  end # => String
end


# ============================================================================== Game Logic

begin

game = GameEngine.new

  
  while !game.game_over? do
    if game.players_turn
      gameover = game.player_take_turn
      break if gameover
    else
      gameover = game.computer_take_turn
      break if gameover
    end
  end 
  
end while game.again?

puts "Thanks for Playing!"