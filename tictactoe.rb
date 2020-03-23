require_relative('lib/Player')

squares = {
  "a1" => " ",
  "a2" => " ",
  "a3" => " ",
  "b1" => " ",
  "b2" => " ",
  "b3" => " ",
  "c1" => " ",
  "c2" => " ",
  "c3" => " ",
}
attributes = ["X", "O"]

win_combinations = [
  [squares["a1"], squares["a2"], squares["a3"]],
  [squares["a1"], squares["b2"], squares["c3"]],
  [squares["a1"], squares["b1"], squares["c1"]],
  [squares["b1"], squares["b2"], squares["b3"]],
  [squares["c1"], squares["c2"], squares["c3"]],
  [squares["c1"], squares["b2"], squares["a3"]],
  [squares["a2"], squares["b2"], squares["c2"]],
  [squares["a3"], squares["b3"], squares["c3"]]
]

def print_grid(squares)
  puts
  puts "   1   2   3"
  puts "A  #{squares["a1"]} | #{squares["a2"]} | #{squares["a3"]} " 
  puts "  ---|---|---"
  puts "B  #{squares["b1"]} | #{squares["b2"]} | #{squares["b3"]} "
  puts "  ---|---|---"
  puts "C  #{squares["c1"]} | #{squares["c2"]} | #{squares["c3"]} "
  puts
end

def who_starts(player_pick)
  case player_pick.upcase
  when "X"
      puts "Alright, you picked #{player_pick.upcase}, so that PC is starting..."
      return "PC"
  when "O"
      puts "Alright, you picked #{player_pick.upcase}, so that YOU are starting..."
      return "YOU"
  else
      puts "Fuck you man! You typed in #{player_pick}. So that PC is starting..."
      return "PC"
  end
end

def get_available_squares(squares)
  available_squares = Hash.new
  squares.each { |key, value|
      if value == " "
          available_squares[key] = value
      end
  }
  return available_squares
end

def pc_random_mark(squares)
  available_squares = get_available_squares(squares)
  squares[available_squares.keys.sample] = "O"
  return squares
end
  
def player_mark(squares)
end

def get_attribute(prompt="Pick 'o' or 'x' as your attribute. 'o' starts :) :", attributes = ["O","X"])
  print(prompt)
  attribute_pick = gets.chomp
  unless attributes.include? attribute_pick.capitalize 
    puts("Hey, you typed in #{attribute_pick}. Get back and pick proper attribute.")
    get_attribute()
  end
  return attribute_pick.upcase
end
#MAIN
### demo player
demo_attribute = attributes.sample
demo_player = Player.new(name = "Demo", attribute = demo_attribute)
demo_square = squares.keys.sample

### welcome text
puts("Hello and welcome to my Tic Tac Toe game ;-)")
print("What is your name?: ")
player_name = gets.chomp
puts("Hello #{player_name.capitalize}! During game, in each round you will be asked to mark square from {A1 to C3},")
puts("e.g. if you pick #{demo_square} as '#{demo_attribute}' the board will looks like this:")
print_grid(demo_player.turn(square = demo_square, squares = squares))
puts(">>> Now, It's time to play!")
player_attribute = get_attribute()
attributes.delete(player_attribute)
User = Player.new(name = player_name.capitalize, attribute = player_attribute)
Computer = Player.new(name = "Computer", attribute = attributes.first)
print("You chose #{player_attribute}, so that ")
if User.get_attribute == "O"
  print("You are ")
else
  print("Computer is ")
end
puts("starting a game.")

# current_player = who_starts(player_pick)
# player = Player.new('Player', 'X')
# puts("#{player.info}")
  
  
  