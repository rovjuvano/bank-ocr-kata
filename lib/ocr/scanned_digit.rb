module OCR
  # Internal: Encapsulate a single digit of a scanned number.
  class ScannedDigit
    # Internal: lookup table to convert OCR represention to internal representation.
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

    # Public: Initialize a single digit of scanned OCR data.
    #
    # line1 - The first three characters of the digit.
    # line2 - The middle three characters of the digit.
    # line3 - The final three characters of the digit.
    def initialize(line1, line2, line3)
      @value_raw = line1 + line2 + line3
    end

    # Public: Get the String representation of digit.
    #
    # Returns The String representation of the digit.
    def value()
      TO_DIGIT[@value_raw]
    end

    # Public: Flag whether digit is legible.
    #
    # Returns true if digit could be recognized
    def legible?
      !!value
    end
  end
end
