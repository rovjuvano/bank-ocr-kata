require 'rspec-given'
require 'ocr'

TO_OCR_DIGIT = {
  '0' => [ ' _ ',
           '| |',
           '|_|' ],
  '1' => [ '   ',
           '  |',
           '  |' ],
}
def ocr_digit(number)
  TO_OCR_DIGIT[number]
end
