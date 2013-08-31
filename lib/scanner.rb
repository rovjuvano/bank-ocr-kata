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
        entry = 4.times.collect { io.readline() }.join('\n')
        y << StringIO.new(entry)
      end
    end
  end

  def digits(io)
    Enumerator.new do |y|
      9.times { y << io.gets(3) }
    end
  end
end
