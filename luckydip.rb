class LuckyDip
  def initialize
    @life = Array(1..47)
    @euro = Array(1..50)
    @euro_extra = Array(1..12)
    @lotto = Array(1..59)
    @thunder = Array(1..39)
  end

  def input
    text
    game = gets.chomp.to_i
    play(game)
  end

  private 

  def text
    puts "Which game should I play?"
    puts "input '1' for SET FOR LIFE"
    puts "input '2' for EUROMILLIONS"
    puts "input '3' for LOTTO"
    puts "input '4' for THUNDERBALL"
  end

  def luck
    puts "Your random numbers are"
  end

  def random(numbers)
    number = numbers.sample
    print "#{number}, "
    numbers.delete(number)
  end

  def play(game)
    luck if game <= 4 && game >= 1
    case game
    when 1
      5.times do
        5.times { random(@life) }
        print "extra -> #{rand(1..10)} \n"
      end
    when 2
      5.times do
        5.times { random(@euro) }
        print "extra -> "
        2.times { random(@euro_extra) }
        puts
      end
    when 3
      5.times do
        6.times { random(@lotto) }
        puts
      end
    when 4
      5.times do
        5.times { random(@thunder) }
        print "extra -> #{rand(1..14)}"
        puts
      end
    else
      print "wrong number. Bye"
    end
  end
end

lets_play = LuckyDip.new
lets_play.input
