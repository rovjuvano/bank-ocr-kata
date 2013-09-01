class BankOCRScanner
  def parse(io)
    Enumerator.new do |y|
      entries(io).each do |line|
        y << parse_entry(line)
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
end
