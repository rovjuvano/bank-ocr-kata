class BankOCRScanner
  def parse(io)
    [
      digits(io).collect() do |d|
        d =~ /^ _ / ? '0' : '1'
      end.join('')
    ]
  end

  def digits(io)
    Enumerator.new do |y|
      9.times { y << io.gets(3) }
    end
  end
end
