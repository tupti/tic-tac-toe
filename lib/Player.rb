class Player  

    def initialize(name, attribute)
        @name = name  
        @attribute = attribute
    end
            
    def info  
        puts "Player info: \n> Name: #{@name}\n> Attribute: #{@attribute}"
    end

    def get_name
        return @name
    end

    def get_attribute
        return @attribute
    end

    def turn(*args)
        if args.length == 2
            if valid_square(args[0], args[1])
                args[1][args[0].downcase] = @attribute
                return args[1]
            else
                return args[1]
            end
        elsif args.length == 1
            ret_squares = args[0]
            ret_squares[get_square(squares = args[0])] = @attribute
            return ret_squares
        end
    end

    def random_turn(squares)
        squares[random_square(squares)] = @attribute
        return squares
    end

    def valid_square(square, squares)
        if squares[square] == " "
            return true
        else
            return false
        end
    end

    def random_square(squares)
        available_squares = Hash.new
        squares.each { |key, value|
            if value == " "
                available_squares[key] = value
            end
        }
        return available_squares.keys.sample
    end

    def get_square(prompt="Pick square:", squares)
        print(prompt)
        square_pick = gets.chomp
        unless ((squares.include? square_pick.downcase) && (squares[square_pick] == " "))
          puts("Hey, you typed in #{square_pick}. It is not valid square.")
          get_square(squares)
        end
        return square_pick.downcase
    end

end 