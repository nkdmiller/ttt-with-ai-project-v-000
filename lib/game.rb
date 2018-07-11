require 'pry'
class Game
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  attr_accessor :board, :player_1, :player_2
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new([" "," "," "," "," "," "," "," "," "]))
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  def current_player
    count = self.board.turn_count
    if count % 2 == 0
      return self.player_1
    else
      return self.player_2
    end
  end
  def won?
    WIN_COMBINATIONS.each do |win_array|
      win_index_1 = win_array[0]
      win_index_2 = win_array[1]
      win_index_3 = win_array[2]

      position_1 = self.board.cells[win_index_1]
      position_2 = self.board.cells[win_index_2]
      position_3 = self.board.cells[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_array
      end
      if position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_array
      end
    end
    return false
  end
  def draw?
    if won? == false
      return true
    else
      return false
    end
  end
  def over?
    if won? == true
      return true
    elsif full? == true
      return true
    else
      return false
    end
  end
  def full?
    self.board.cells.all? do |position|
      position == "X" || position == "O"
    end
  end
  def winner
    WIN_COMBINATIONS.each do |win_array|
      win_index_1 = win_array[0]
      win_index_2 = win_array[1]
      win_index_3 = win_array[2]

      position_1 = self.board.cells[win_index_1]
      position_2 = self.board.cells[win_index_2]
      position_3 = self.board.cells[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return "X"
      end
      if position_1 == "O" && position_2 == "O" && position_3 == "O"
        return "O"
      end
    end
    return nil
  end
  def turn
    if over? == true
      return
    else
      player = self.current_player
      player.move(self.board)
    end
  end
  def play
    while over? == true
      self.turn
    end
  end
end
