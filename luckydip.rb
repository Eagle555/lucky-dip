# Generate random numbers for the lottery
class LuckyDip
  def initialize
    @life = Array(1..47) # SET FOR LIFE numbers
    @euro = Array(1..50) # EUROMILLIONS numbers
    @euro_extra = Array(1..12) # EUROMILLIONS EXTRA numbers
    @lotto = Array(1..59) # LOTTO numbers
    @thunder = Array(1..39) # THUNDERBALL numbers
    @analysis_life = {}
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
    puts "input '1' to exit"
    puts "input '2' for SET FOR LIFE"
    puts "input '3' for EUROMILLIONS"
    puts "input '4' for LOTTO"
    puts "input '5' for THUNDERBALL"
    puts "input '6' for EUROMILLIONS HOTPICKS"
    puts "input '7' for LOTTO HOTPICKS"
    puts "input '8' for SET FOR LIFE analysis"
  end

  def luck
    puts "Your random numbers are"
  end

  def analysis(numbers)
    number = numbers.sample
    unless @analysis_life[number]
      @analysis_life.store(number, 1)
    else @analysis_life[number]
      @analysis_life[number] += 1
    end
  end

  def random(numbers)
    number = numbers.sample
    print "#{number}, "
    numbers.delete(number)
  end

  def play(game, lines) # generation choice
    luck if game <= 4 && game >= 1
    line = 0
    case game
    when 1 # exit the app
      puts "Thank you. Bye"
    when 2 # generate SET FOR LIFE numbers
      lines.times do
        line += 1
        print "Line #{line}: "
        5.times { random(@life) }
        print "extra -> #{rand(1..10)} \n"
        initialize
      end
    when 3 # generate EUROMILLIONS numbers
      lines.times do
        line += 1
        print "Line #{line}: "
        5.times { random(@euro) }
        print "extra -> "
        2.times { random(@euro_extra) }
        puts
        initialize
      end
    when 4 # generate LOTTO numbers
      lines.times do
        line += 1
        print "Line #{line}: "
        6.times { random(@lotto) }
        puts
        initialize
      end
    when 5 # generate THUNDERBALL numbers
      lines.times do
        line += 1
        print "Line #{line}: "
        5.times { random(@thunder) }
        print "extra -> #{rand(1..14)}"
        puts
        initialize
      end
    when 6 # generate EUROMILLIONS HOTPICKS numbers
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
    when 7 # generate LOTTO HOTPICKS numbers
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
    when 8 # High number projection based on most random number generation
      lines.times do
        line += 1
        print "Line #{line}: "
        1_000_000.times { analysis(@life) }
        print "extra -> #{rand(1..10)} \n"
        puts "Number projection based on most random number generation"
        p @analysis_life.sort_by(&:last).reverse
      end
    else # repeat if wrong number
      puts "Wrong number. Try again"
      input
    end
  end
end
