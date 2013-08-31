class BankOCRScanner
  def parse(io)
    result = ''
    digits(io) do |d|
      result << (d =~ /^ _ / ? '0' : '1')
    end
    [result]
  end

  def digits(io, &block)
    9.times { yield io.gets(3) }
  end
end
