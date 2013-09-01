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
    digit =~ /^ _ / ? '0' : '1'
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
      0.upto(8){ |i| y << entry[i*3,3] }
    end
  end
end
