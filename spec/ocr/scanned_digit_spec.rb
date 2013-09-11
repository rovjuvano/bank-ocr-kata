require 'spec_helper'

module OCR
  describe ScannedDigit do
    ('0'..'1').each do |digit|
      context("when pattern represents #{digit}") do
        Given(:lines) { ocr_digit(digit) }
        When(:scanned_digit) { OCR::ScannedDigit.new(*lines) }
        Then { scanned_digit.value == digit }
      end
    end
  end
end
