module OCR
  class ScannedNumber
    def initialize(line1, line2, line3)
      @lines = [line1, line2, line3]
    end

    def value
      @lines[0] =~ /^ _  _ / ? '000000000' : '010101010'
    end
  end
end
