module OCR
  class ScannedDigit
    def initialize(line1, line2, line3)
      @value_raw = line1 + line2 + line3
    end

    def value()
      @value_raw =~ /^ _ / ? '0' : '1'
    end
  end
end
