require 'pry'

def ai_choose_play_index(arr) # <= Array
    # horizontals
    hor = [[0,1,2], [3,4,5], [6,7,8]]
    hor.each do |group|
        found = find_third_index group, arr
        return found if found != nil
    end
    
    # verticals
    ver = [[0,3,6], [1,4,7], [2,5,8]]
    ver.each do |group|
        found = find_third_index group, arr
        return found if found != nil
    end
    
    # diagonals
    dia = [[0,4,8], [2,4,6]]
    dia.each do |group|
        found = find_third_index group, arr
        return found if found != nil
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
    if two_os.count == 2 && available_index.count == 1
        return available_index[0]
    end
    nil
end # => Integer or nil

def print_ttt_board(arr) # <= Array
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

plays_array = []
%w(A B C D E F G H I).each do |x|
    plays_array << ["X", "O", x].sample
end

chosen = ai_choose_play_index plays_array

print_ttt_board plays_array 
puts "AI chose: #{chosen}"