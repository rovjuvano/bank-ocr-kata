class BankOCRScanner
  def parse(io)
    Enumerator.new do |y|
      entries(io).each do |line|
        entry = parse_entry(line)
        y << Entry.new(entry)
      end
    end
  end

  private
  def parse_entry(line)
    digits(line).collect() do |d|
      parse_digit(d)
    end.join('')
  end

  DIGITS = {
    ' _ | ||_|' => '0',
    '     |  |' => '1',
    ' _  _||_ ' => '2',
    ' _  _| _|' => '3',
    '   |_|  |' => '4',
    ' _ |_  _|' => '5',
    ' _ |_ |_|' => '6',
    ' _   |  |' => '7',
    ' _ |_||_|' => '8',
    ' _ |_| _|' => '9',
  }
  def parse_digit(digit)
    DIGITS[digit.join('')]
  end

  def entries(io)
    Enumerator.new do |y|
      until io.eof?
        y << io.gets('')
      end
    end
  end

  def digits(entry)
    Enumerator.new do |y|
      (0...27).step(3) do |base|
        y << [
          entry[base,    3],
          entry[base+28, 3],
          entry[base+56, 3]
        ]
      end
    end
  end

  class Entry
    attr_reader :number

    def initialize(number)
      @number = number
    end

    def ==(other)
      @number == other.number
    end

    def valid?()
      sum = 0
      1.upto(9) do |i|
        sum += @number[9-i].to_i * i
      end
      sum % 11 == 0
    end
  end
end
