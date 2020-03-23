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

    def turn(square, squares)
        if valid_square(square, squares)
            squares[square.downcase] = @attribute
            return squares
        else
            return squares
        end
    end

    def random_turn(squares)
        squares[random_pick(squares)] = @attribute
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

end 