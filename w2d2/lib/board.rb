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
    cups.each_with_index do |cup, idx|
      4.times{ cup << :stone } unless idx == 6 || idx == 13
    end
  end

  def valid_move?(start_pos)
    if !start_pos.between?(0, 12) || cups[start_pos].empty?
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    stones = cups[start_pos]
    cups[start_pos] = []
    curr_pos = start_pos
    until stones.empty?
      curr_pos += 1
      curr_pos = 0 if curr_pos > 13
      if current_player_name == @name1
        cups[curr_pos] << stones.pop unless curr_pos == 13
      else
        cups[curr_pos] << stones.pop unless curr_pos == 6
      end
    end
    render
    next_turn(curr_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    if cups[ending_cup_idx].size == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    count = cups.map(&:size)
    count[0...6].sum == 0 || count[7...13].sum == 0
  end

  def winner
    case cups[6].size <=> cups[13].size
    when 0
      :draw
    when 1
      @name1
    when -1
      @name2
    end
  end
end
