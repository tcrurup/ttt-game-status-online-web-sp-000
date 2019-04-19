

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row 
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #first column
  [1,4,7], #second column
  [2,5,8], #third column
  [6,4,2], #diagonal foward slash
  [0,4,8], #diagonal back slash
]

def won?(board)
  
  x_positions = []
  o_positions = []
  index = 0;
  
  board.each do |board_space|
    if board_space == 'X'
      x_positions << index
    elsif board_space == 'O'
      o_positions << index
    end
    index+=1
  end
      
  WIN_COMBINATIONS.each do |winning_position|
    if(
      winning_position.all? {|pos| x_positions.include?(pos)} || 
      winning_position.all? {|pos| o_positions.include?(pos)}
    )
      return winning_position
    end
  end
  
  return false
end

def full?(board)
  !board.include?(" ")
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board)
end

def winner(board)
  winning_position = won?(board)
  if winning_position
    board[winning_position[0]]
  end
end