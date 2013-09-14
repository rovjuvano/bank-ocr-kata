require 'spec_helper'

module OCR
  module Guessing
    module Digit
      describe BitFlipper do
        Given(:guesser) { BitFlipper.new }

        describe '#differences' do
          context 'with 0 differences' do
            Given(:a) { ['   ', '   ', '   '] }
            Then { guesser.differences(a, a) == 0 }
          end
        end
      end
    end
  end
end
