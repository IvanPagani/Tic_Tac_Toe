module SetUp
  def self.players
    print "Player 1 name: "
    p1_name = gets.chomp
    print "Player 1 symbol ('X' or 'O'): "
    p1_symbol = gets.chomp.upcase

    until %w[X O].include?(p1_symbol)
      print "Invalid. Choose either 'X' or 'O': "
      p1_symbol = gets.chomp.upcase
    end

    print "Player 2 name: "
    p2_name = gets.chomp
    p2_symbol = p1_symbol == "X" ? "O" : "X"
    puts "Player 2 symbol ('X' or 'O'): #{p2_symbol}"

    [Player.new(p1_name, p1_symbol), Player.new(p2_name, p2_symbol)]
  end

  def self.game(player1, player2)
    Game.new(player1, player2)
  end
end
