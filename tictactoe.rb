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

def get_available_squares(squares)
  available_squares = Hash.new
  squares.each { |key, value|
      if value == " "
          available_squares[key] = value
      end
  }
  return available_squares
end

def cleanup_grid(squares)
  squares.each{ |key, value|
    squares[key] = " "
  }
  return squares
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
squares = cleanup_grid(squares)
puts(">>> Now, It's time to play!")
player_attribute = get_attribute()
attributes.delete(player_attribute)
User = Player.new(name = player_name.capitalize, attribute = player_attribute)
Computer = Player.new(name = "Computer", attribute = attributes.first)
Users = [User, Computer]
current_player = ''
Users.each{ |item|
  if item.get_attribute == "O"
    puts("#{item.get_name} begin a game")
    current_player = item
  end
}
iterations = 0
while true
  iterations+=1
    if current_player.get_name == Computer.get_name
      squares = Computer.random_turn(squares)
      puts("Computer turn:")
      print_grid(squares)
      current_player = User
    else
      squares = User.turn(squares)
      puts("Your turn:")
      print_grid(squares)
      current_player = Computer
    end
  if iterations >= 9
    puts("It is DRAW!")
    break
  end
  #check_for_winner
end
  
  
  