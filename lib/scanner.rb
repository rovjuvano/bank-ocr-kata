class BankOCRScanner
  def parse(io)
    entries(io).collect() do |line|
      digits(line).collect() do |d|
        d =~ /^ _ / ? '0' : '1'
      end.join('')
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
      0.upto(8){ |i| y << entry[i*3,3] }
    end
  end
end
