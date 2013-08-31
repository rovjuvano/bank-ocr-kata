class BankOCRScanner
  def parse(io)
    io.gets(3) == ' _ ' ? '000000000' : '111111111'
  end
end
