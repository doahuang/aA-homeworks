class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    welcome
    take_turn until game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message unless game_over
    self.sequence_length += 1
  end

  def show_sequence
    add_random_color
    seq.each do |color|
      clear_screen
      puts "#{color}"
      sleep(0.5)
      clear_screen
      sleep(0.5)
    end
  end

  def require_sequence
    puts "enter each color in order\n\n"
    seq.each do |color|
      unless match?(gets.chomp, color)
        self.game_over = true
        break
      end
    end
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "\nnext round..."
    sleep(1)
  end

  def game_over_message
    puts "\ngame over!\nyou made it to round #{sequence_length - 1}"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end

  private
  def welcome
    clear_screen
    puts "let's play Simon"
    gets.chomp
  end

  def match?(color, other_color)
    color.size > 1 ? color == other_color : color == other_color[0]
  end

  def clear_screen
    system("clear")
  end
end

Simon.new.play if $PROGRAM_NAME == __FILE__
