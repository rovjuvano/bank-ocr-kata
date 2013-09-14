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
          context 'with no matches' do
            Given(:lines) { ocr_digit(' ') }
            When(:guesses) { guesser.guesses(*lines) }
            Then { guesses == [] }
          end

          context 'with one match' do
            Given(:lines) { ocr_digit('1') }
            When(:guesses) { guesser.guesses(*lines) }
            Then { guesses == [ ocr_scanned_digit('7') ] }
          end

          context 'with multiple matches' do
            Given(:lines) { ocr_digit(159) }
            When(:guesses) { guesser.guesses(*lines) }
            Then { guesses == ['2', '3', '8'].collect { |n| ocr_scanned_digit(n) } }
          end
        end
      end
    end
  end
end
