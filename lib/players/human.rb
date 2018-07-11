require 'pry'
module Players
  class Human < Player
    def move
      moved = false
      while moved == false
        puts "Please select cell."
        input = gets.strip
        input = input.to_i
        if self.board.valid_move?(input) == true
          self.board.cells[input] = self.token
          moved = true
        else
          return "invalid"
        end
      end
      return input.to_s
    end
  end
end
