require 'spec_helper'

module OCR
  module Guessing
    describe SingleDigit do
      Given(:guesser) { SingleDigit.new }
      Given(:lines) { ocr_number(number) }
      Given(:scanned_number) { OCR::ScannedNumber.new(*lines) }
      When(:guesses) { guesser.guesses(scanned_number) }
      Invariant { guesses == expected }

      context 'with no matches' do
        Given(:number) { :underscores }
        Given(:expected) { [] }
        Then {}
      end
    end
  end
end
