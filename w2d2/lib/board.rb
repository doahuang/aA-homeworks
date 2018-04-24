class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14){ [] }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each]
    four_stones = [:stone] * 4
    cups.each_with_index do |cup, idx|
      four_stones.each{ |stone| cup << stone } unless idx == 6 || idx == 13
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(1, 12)
  end

  def make_move(start_pos, current_player_name)
    stones = cups[start_pos].size
    cups[start_pos] = []
    cups_idx = (start_pos + 1..start_pos + stones).to_a
    if current_player_name == @name1
      cups_idx.map!{ |i| i < 13 ? i : i - 13 }
    else
      cups_idx.map!{ |i| i > 13 ? i - 14 : i }
    end
    cups_idx.each{ |i| cups[i] << :stone }
    render
    next_turn(cups_idx.last)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    last_cup = cups[ending_cup_idx]
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    last_cup.size == 1 ? :switch : ending_cup_idx
  end

  def render
    # print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    # puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    # print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    # puts ""
    # puts ""
  end

  def one_side_empty?
    (0..5).all?{ |i| cups[i].empty? } || (7..12).all?{ |i| cups[i].empty? }
  end

  def winner
    case cups[6] <=> cups[13]
    when 0
      :draw
    when 1
      @name1
    when -1
      @name2
    end
  end
end
