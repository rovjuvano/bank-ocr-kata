require 'spec_helper'

module OCR
  describe ScannedDigit do
    ('0'..'9').each do |digit|
      context("when pattern represents #{digit}") do
        Given(:lines) { ocr_digit(digit) }
        When(:scanned_digit) { OCR::ScannedDigit.new(*lines) }
        Then { scanned_digit.value == digit }
         And { scanned_digit.legible? }
      end
    end

    context 'when pattern not recognized' do
      Given(:lines) { ocr_digit(' ') }
      When(:scanned_digit) { OCR::ScannedDigit.new(*lines) }
      Then { not scanned_digit.legible? }
       And { scanned_digit.value == '?' }
    end

    describe '#==' do
      context 'with same value' do
        Given(:a) { ocr_scanned_digit('0') }
        Given(:b) { ocr_scanned_digit('0') }
        Then { a == b }
      end

      context 'with different values' do
        Given(:a) { ocr_scanned_digit('0') }
        Given(:b) { ocr_scanned_digit('8') }
        Then { a != b }
      end

      context 'with different values' do
        Given(:a) { ocr_scanned_digit(' ') }
        Given(:b) { ocr_scanned_digit(:all) }
        Then { a != b }
         And { a.value == b.value }
      end
    end
  end
end
