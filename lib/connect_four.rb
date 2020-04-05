#connect four game

class ConnectFour
  attr_accessor :board
  attr_reader :status

  def initialize
    @board = make_board
    @status = "inPlay"
  end

  #prepare game board, cols
  def make_board
    arr = []
    for x in 0..6
      arr[x] = ['_','_','_','_','_','_']
    end
    return arr
  end

  #prints the board, 6 cols x 7 rows
  #cols start from bottom up, eg col[0] is bottom
  def show_board
    puts "1 2 3 4 5 6 7"   #first prints column numbers for user clarity
    for row in 5.downto(0)
      for col in 0..6
        print "#{@board[col][row]} "
      end
      print "\n"
    end
  end

  #method to check for valid user input and to set piece on board
  def put_piece(player,col)
    #check for valid user input
    if !col.between?(1,7)
      puts "Error: Enter valid column."
      return "Error"
    end

    #check if column is full
    if !@board[col-1].include? "_"
      puts "Error: Column is full! Choose another column."
      return "Error"
    end

    #set first empty column slot to player token
    for x in 0..5
      if @board[col-1][x] == '_'
        @board[col-1][x] = player
        break
      end
    end
  end

  #check if player met win condition (4 in a row)
  def check_win(player)
    row_win_check(player)
    col_win_check(player)
    diag_win_check(player)
    anti_diag_win_check(player)
    @status
  end

  def row_win_check(player)
    #check row win condition
    streak = 1
    for row in 5.downto(0)
      for col in 1..6
        if @board[col][row] == @board[col-1][row] and @board[col][row] == player
          streak += 1
          @status = "Player #{player} wins!" if streak == 4
        else
          streak = 1
        end
      end
    end
  end

  def col_win_check(player)
    #check col win condition
    streak = 1
    for col in 0..6
      for row in 1..6
        if @board[col][row] == @board[col][row-1] and @board[col][row] == player
          streak += 1
          @status = "Player #{player} wins!" if streak == 4
        else
          streak = 1
        end
      end
    end
  end

  def diag_win_check(player)
    streak = 1
    #diag win condition
    for x in 0..3
      for col in 1..6
        next if @board[col+x].nil?
        next if @board[col+x][col].nil?
        if @board[col+x][col] == @board[col+x-1][col-1] and @board[col+x][col] == player
          streak += 1
          @status = "Player #{player} wins!" if streak == 4
        else
          streak = 1
        end
      end
    end

    #diag corner case 1 - col[0]row[2] to col[3]row[5]
    streak = 1
    for col in 1..3
      if @board[col][col+2] == @board[col-1][col+2-1] and @board[col][col+2] == player
        streak += 1
        @status = "Player #{player} wins!" if streak == 4
      else
        streak = 1
      end
    end

    #diag corner case 2 - col[0]row[1] to col[4]row[5]
    streak = 1
    for col in 1..4
      if @board[col][col+1] == @board[col-1][col+1-1] and @board[col][col+1] == player
        streak += 1
        @status = "Player #{player} wins!" if streak == 4
      else
        streak = 1
      end
    end
  end

  def anti_diag_win_check(player)
    #anti-diag win condition
    streak = 1
    for x in 0..3
      for col in 1..6
        next if @board[col+x].nil?
        next if @board[col+x][col].nil?
        if @board[col+x][5-col] == @board[col+x-1][5-col+1] and @board[col+x][5-col] == player
          streak += 1
          @status = "Player #{player} wins!" if streak == 4
        else
          streak = 1
        end
      end
    end

    #anti-diag corner case 1 - col[0]row[4] to col[4]row[0]
    streak = 1
    for col in 1..4
      if @board[col][4-col] == @board[col-1][4-col+1] and @board[col][4-col] == player
        streak += 1
        @status = "Player #{player} wins!" if streak == 4
      else
        streak = 1
      end
    end

    #anti-diag corner case 2 - col[0]row[3] to col[3]row[0]
    streak = 1
    for col in 1..3
      if @board[col][3-col] == @board[col-1][3-col+1] and @board[col][3-col] == player
        streak += 1
        @status = "Player #{player} wins!" if streak == 4
      else
        streak = 1
      end
    end
  end

  #prints post-game messages
  def post_game_messages(player)
    puts ""
    self.show_board
    puts ""
    if @status != 'inPlay'
      puts @status
    else
      puts "DRAW!"
    end
  end

end

#this method cycles through player turn
def set_player(turn)
  if turn % 2 == 0
    return "X"
  end

  return "O"
end

#main game loop
def play_game(game)
  turnCount = 0
  player = ""
  loop do
    game.show_board
    puts ""
    player = set_player(turnCount)
    puts "Player #{player}: Enter column to place your piece!"
    col = gets.chomp.to_i
    puts ""

    turnCount += 1 if game.put_piece(player, col) != "Error"

    game.check_win(player)

    break if game.status != 'inPlay' or turnCount == 42
  end

  game.post_game_messages(player) #display final game status

end

game = ConnectFour.new
play_game(game)
