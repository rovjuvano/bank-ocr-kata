require 'spec_helper'

module OCR
  module Guessing
    describe Base do
      Given(:guesser) { Base.new }
      When(:guesses) { guesser.guesses(nil) }
      Then { guesses == [] }
    end
  end
end
