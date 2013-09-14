require 'spec_helper'

module OCR
  module Guessing
    module Digit
      describe BitFlipper do
        Given(:guesser) { BitFlipper.new }

        describe '#differences' do
          Given(:a) { ['   ', '   ', '   '] }

          [ ['   ', '   ', '   '],
            ['   ', '   ', '  |'],
            ['   ', '   ', ' _|'],
            ['   ', '   ', '|_|'],
            ['   ', '  |', '|_|'],
            ['   ', ' _|', '|_|'],
            ['   ', '|_|', '|_|'],
            ['  |', '|_|', '|_|'],
            [' _|', '|_|', '|_|'],
            ['|_|', '|_|', '|_|'] ].each_with_index do |b, i|
            context "with #{i} difference(s)" do
              Then { guesser.differences(a, b) == i }
               And { guesser.differences(b, a) == i }
            end
          end
        end

        describe '#guesses' do
          Given(:lines) { ocr_digit(digit) }
          When(:guesses) { guesser.guesses(*lines) }
          Invariant { guesses == expected.collect { |n| ocr_scanned_digit(n) } }

          context 'with no matches' do
            Given(:digit) { ' ' }
            Given(:expected) { [] }
            Then {}
          end

          context 'with one match' do
            Given(:digit) { '1' }
            Given(:expected) { ['7'] }
            Then {}
          end

          context 'with multiple matches' do
            Given(:digit) { 159 }
            Given(:expected) { ['2', '3', '8'] }
            Then {}
          end
        end
      end
    end
  end
end
