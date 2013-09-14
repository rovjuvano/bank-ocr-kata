module OCR
  module Guessing
    module Digit
      class Base
        # Public: Guess what other digits an OCR digit could represent.
        #
        # line1 - The first three characters of the digit.
        # line2 - The middle three characters of the digit.
        # line3 - The final three characters of the digit.
        #
        # Returns the Enumerator of guessed ScannedDigits.
        def guesses(line1, line2, line3)
          []
        end
      end
    end
  end
end
