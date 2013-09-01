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

  def parse_digit(digit)
    if digit[0] =~ /^ _ /
      if digit[1] =~ /^ _\|/
        digit[2] =~ /^ _\|/ ? '3' : '2'
      else
        '0'
      end
    else
      '1'
    end
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
      0.upto(8) { |i| y << [ entry[i*3,3], entry[i*3+28,3], entry[i*3+56,3] ] }
    end
  end
end
