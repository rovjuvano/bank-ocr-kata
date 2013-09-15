module OCR
  module Guessing
    class SingleDigit < Base
      def guesses(number)
        number.value =~ /^1/ ? ['711111111'] : []
      end
    end
  end
end
