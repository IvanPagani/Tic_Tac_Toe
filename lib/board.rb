class Board
  attr_reader :state

  def initialize
    @state = ("1".."9").to_a
  end

  def show
    puts "\n"
    puts " #{state[0]} | #{state[1]} | #{state[2]} "
    puts "---+---+---"
    puts " #{state[3]} | #{state[4]} | #{state[5]} "
    puts "---+---+---"
    puts " #{state[6]} | #{state[7]} | #{state[8]} "
    puts "\n"
  end

  def valid?(cell)
    @state.include?(cell) && !%w[X O].include?(cell)
  end

  def modify(cell, symbol)
    cell = cell.to_i
    @state[cell - 1] = symbol
  end
end
