require 'spec_helper'

module OCR
  module Guessing
    module Digit
      describe Base do
        Given(:guesser) { Base.new }
        When(:guesses) { guesser.guesses(nil, nil, nil) }
        Then { guesses == [] }
      end
    end
  end
end
