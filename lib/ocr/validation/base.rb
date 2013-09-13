module OCR
  module Validation
    # Public: Base class for validating numbers.
    class Base
      # Public: Indicate whether number is among the valid set of account numbers.
      #
      # digits - The Enumerator of the nine ScannedDigits of the number.
      #
      # Returns true, always.
      def valid?(digits)
        true
      end
    end
  end
end

