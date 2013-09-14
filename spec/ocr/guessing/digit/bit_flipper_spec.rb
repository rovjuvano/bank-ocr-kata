require 'spec_helper'

module OCR
  module Guessing
    module Digit
      describe BitFlipper do
        Given(:guesser) { BitFlipper.new }

        describe '#differences' do
          Given(:a) { ['   ', '   ', '   '] }

          context 'with 0 differences' do
            Then { guesser.differences(a, a) == 0 }
          end

          context 'with 1 difference' do
            Given(:b) { ['  |', '   ', '   '] }
            Then { guesser.differences(a, b) == 1 }
          end
        end
      end
    end
  end
end
