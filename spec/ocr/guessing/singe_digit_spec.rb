require 'spec_helper'

module OCR
  module Guessing
    describe SingleDigit do
      Given(:guesser) { SingleDigit.new }
      Given(:scanned_number) { ocr_scanned_number(number) }
      When(:guesses) { guesser.guesses(scanned_number) }
      Invariant { guesses.sort == expected.sort }

      context 'with no matches' do
        Given(:number) { :underscores }
        Given(:expected) { [] }
        Then {}
      end

      context 'with a single match' do
        Given(:number) { :ones }
        Given(:expected) { ['711111111'] }
        Then {}
      end

      context 'with multiple matches' do
        Given(:number) { :eights }
        Given(:expected) { ['888886888', '888888880', '888888988'] }
        Then {}
      end
    end
  end
end
