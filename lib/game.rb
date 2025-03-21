class Game
  VICTORY = [[0, 1, 2], [3, 4, 5], [6, 7, 8], # rows
             [0, 3, 6], [1, 4, 7], [2, 5, 8], # collumns
             [2, 4, 6], [0, 4, 8]].freeze     # diagonals

  attr_accessor :current_player, :next_player, :board

  def initialize(current_player, next_player)
    @current_player = current_player
    @next_player = next_player
    @board = Board.new
  end

  def play_turn
    puts "#{current_player.name}'s turn."
    print "Select your '#{current_player.symbol}' position: "
    choice = gets.chomp

    until @board.valid?(choice)
      print "Invalid. Select a valid position: "
      choice = gets.chomp
    end

    @board.modify(choice, @current_player.symbol)
  end

  def switch_players
    @current_player, @next_player = @next_player, @current_player
  end

  def victory?
    VICTORY.any? do |win_condition|
      win_condition.all? { |i| @board.state[i] == current_player.symbol }
    end
  end

  def over?
    @board.state.none? { |i| ("1".."9").include?(i) }
  end

  def announce_winner
    puts "The winner is: #{@current_player.name}!"
  end

  def announce_tie
    puts "It's a draw."
  end
end
