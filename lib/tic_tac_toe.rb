class TicTacToe
 
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [2,4,6]
  ] 

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end  
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end  

  def move(index,token)
    @board[index] = token
  end  

  def position_taken?(index)
    ((@board[index] == "X") || (@board[index] == "O"))
  end  
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count
    number_of_turns = 0
    @board.each do |space|
      if space == "X" || space == "O"
        number_of_turns += 1
      end
    end 
  number_of_turns
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
    
    # could also be written out as
    # if turn_count % 2 == 0
    #     "X"
    #   else 
    #     "O"
    # end    
    
    # could also be written out as
    # def current_player
    # if turn_count.even? 
    #   "X"
    # else 
    #   "O"
    # end 
  end 
    
  end  

  def turn
    puts "Please choose a position between 1-9:"
    input = gets.strip     
    index = input_to_index(input)
    token = current_player
    if valid_move?(index)
      move(index, token)
      display_board
    else
      turn
    end 
  end
  
  def won?
    WIN_COMBINATIONS.detect do |winner|
      if (@board[winner[0]]) == "X" &&
        (@board[winner[1]]) == "X" &&
        (@board[winner[2]]) == "X"
          return winner
        elsif
          (@board[winner[0]]) == "O" &&
          (@board[winner[1]]) == "O" &&
          (@board[winner[2]]) == "O"
          return winner
      end
        false
    end
  end  
  
  def full?
    @board.all?{|occupied| occupied != " "}
  end

  def draw?
    full? && !won?
  end  
  
  def over?
    won? || full? || draw?
  end  
  
  def winner
    WIN_COMBINATIONS.detect do |winner|
      if (@board[winner[0]]) == "X" &&
        (@board[winner[1]]) == "X" &&
        (@board[winner[2]]) == "X"
          return "X"
        elsif
          (@board[winner[0]]) == "O" &&
          (@board[winner[1]]) == "O" &&
          (@board[winner[2]]) == "O"
          return "O"
      end
        nil
    end
  end  
  
  def play
    while over? == false
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
<<<<<<< HEAD
      puts "Cat's Game!"
    end  
  end
=======
      puts "Sorry, the game was a #{draw?} try again."
    end  
  end
  
  
  
  
  
>>>>>>> 0c2fcea968f4fa114aacc94a81bf78ae6728e2cc
end  