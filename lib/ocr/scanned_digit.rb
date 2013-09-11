module OCR
  class ScannedDigit
    TO_DIGIT = {
      ' _ ' +
      '| |' +
      '|_|' => '0',
      '   ' +
      '  |' +
      '  |' => '1',
      ' _ ' +
      ' _|' +
      '|_ ' => '2',
      ' _ ' +
      ' _|' +
      ' _|' => '3',
      '   ' +
      '|_|' +
      '  |' => '4',
      ' _ ' +
      '|_ ' +
      ' _|' => '5',
      ' _ ' +
      '|_ ' +
      '|_|' => '6',
      ' _ ' +
      '  |' +
      '  |' => '7',
      ' _ ' +
      '|_|' +
      '|_|' => '8',
      ' _ ' +
      '|_|' +
      ' _|' => '9',
    }

    def initialize(line1, line2, line3)
      @value_raw = line1 + line2 + line3
    end

    def value()
      TO_DIGIT[@value_raw]
    end
  end
end
