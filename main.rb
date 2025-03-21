require_relative "lib/set_up"
require_relative "lib/game"
require_relative "lib/board"
require_relative "lib/player"

player_arr = SetUp.players
new_game   = SetUp.game(player_arr[0], player_arr[1])

puts "\n"
puts "+-------------+"
puts "| TIC-TAC-TOE |"
puts "+-------------+"
puts "\n"

new_game.board.show

loop do
  new_game.play_turn
  new_game.board.show
  break if new_game.victory? || new_game.over?

  new_game.switch_players
end

new_game.victory? ? new_game.announce_winner : new_game.announce_tie
