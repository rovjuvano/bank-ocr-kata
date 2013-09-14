require 'rspec-given'
require 'ocr'

TO_OCR_DIGIT = {
  '0' => [ ' _ ',
           '| |',
           '|_|' ],
  '1' => [ '   ',
           '  |',
           '  |' ],
  '2' => [ ' _ ',
           ' _|',
           '|_ ' ],
  '3' => [ ' _ ',
           ' _|',
           ' _|' ],
  '4' => [ '   ',
           '|_|',
           '  |' ],
  '5' => [ ' _ ',
           '|_ ',
           ' _|' ],
  '6' => [ ' _ ',
           '|_ ',
           '|_|' ],
  '7' => [ ' _ ',
           '  |',
           '  |' ],
  '8' => [ ' _ ',
           '|_|',
           '|_|' ],
  '9' => [ ' _ ',
           '|_|',
           ' _|' ],
  ' ' => [ '   ',
           '   ',
           '   ' ],
  :all => [ '|_|',
            '|_|',
            '|_|' ],
}
def ocr_digit(number)
  TO_OCR_DIGIT[number]
end

def ocr_scanned_digit(number)
  OCR::ScannedDigit.new(*ocr_digit(number))
end

def ocr_digits(number)
  number.chars.collect { |n| ocr_scanned_digit(n) }
end

def ocr_number(number)
  TO_OCR_NUMBER[number] || fail("Test case not setup in fixture: OCR number #{number}")
end

def ocr_file(*numbers)
  StringIO.new(ocr_contents(*numbers))
end

def ocr_contents(*numbers)
  numbers.collect do |n|
    TO_OCR_NUMBER[n].join("\n")
  end.join("\n\n") + "\n\n"
end

TO_OCR_NUMBER = {
  :zeros => [
    ' _  _  _  _  _  _  _  _  _ ',
    '| || || || || || || || || |',
    '|_||_||_||_||_||_||_||_||_|'
  ],
  :ones => [
    '                           ',
    '  |  |  |  |  |  |  |  |  |',
    '  |  |  |  |  |  |  |  |  |'
  ],
  :one_to_nine => [
    '    _  _     _  _  _  _  _ ',
    '  | _| _||_||_ |_   ||_||_|',
    '  ||_  _|  | _||_|  ||_| _|'
  ],
  :illegible_checksum => [
    '                         _ ',
    '  |                      _|',
    '  |                     |_ '
  ],
}
