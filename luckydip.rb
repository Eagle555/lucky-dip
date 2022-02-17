# Generate random numbers for the lottery
class LuckyDip
  def initialize
    @life = Array(1..47) # SET FOR LIFE numbers
    @euro = Array(1..50) # EUROMILLIONS numbers
    @euro_extra = Array(1..12) # EUROMILLIONS EXTRA numbers
    @lotto = Array(1..59) # LOTTO numbers
    @thunder = Array(1..39) # THUNDERBALL numbers
  end

  def input
    text
    game = gets.chomp.to_i
    puts "How many lines should I generate? (max. 100)"
    lines = gets.chomp.to_i
    lines = 5 unless lines <= 100 && lines >= 1
    play(game, lines)
  end

  private 

  def text # text for menu
    puts "Which game should I play?"
    puts "input '1' for SET FOR LIFE"
    puts "input '2' for EUROMILLIONS"
    puts "input '3' for LOTTO"
    puts "input '4' for THUNDERBALL"
    puts "input '5' for EUROMILLIONS HOTPICKS"
    puts "input '6' for LOTTO HOTPICKS"
    puts "input '7' to exit"
  end

  def luck
    puts "Your random numbers are"
  end

  def random(numbers)
    number = numbers.sample
    print "#{number}, "
    numbers.delete(number)
  end

  def play(game, lines)
    luck if game <= 4 && game >= 1
    line = 0
    case game
    when 1 # generate SET FOR LIFE numbers
      lines.times do
        line += 1
        print "Line #{line}: "
        5.times { random(@life) }
        print "extra -> #{rand(1..10)} \n"
        initialize
      end
    when 2
      lines.times do
        line += 1
        print "Line #{line}: "
        5.times { random(@euro) }
        print "extra -> "
        2.times { random(@euro_extra) }
        puts
        initialize
      end
    when 3
      lines.times do
        line += 1
        print "Line #{line}: "
        6.times { random(@lotto) }
        puts
        initialize
      end
    when 4
      lines.times do
        line += 1
        print "Line #{line}: "
        5.times { random(@thunder) }
        print "extra -> #{rand(1..14)}"
        puts
        initialize
      end
    when 5
      puts "Pick how many numbers you want to match (1-5)"
      pick = gets.chomp.to_i
      pick = 5 unless pick <= 5 && pick >= 1
      luck
      lines.times do
        line += 1
        print "Line #{line}: "
        pick.times { random(@euro) }
        puts
        initialize
      end
    when 6
      puts "Pick how many numbers you want to match (1-5)"
      pick = gets.chomp.to_i
      pick = 5 unless pick <= 5 && pick >= 1
      luck
      lines.times do
        line += 1
        print "Line #{line}: "
        pick.times { random(@lotto) }
        puts
        initialize
      end
    when 7
      puts "Thank you. Bye"
    else
      puts "Wrong number. Try again"
      input
    end
  end
end

lets_play = LuckyDip.new
lets_play.input
