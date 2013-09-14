module OCR
  module Validation
    # Public: Base class for validating numbers.
    class Base
      # Public: Indicate whether number is among the valid set of account numbers.
      #
      # digits - The Enumerator of the nine ScannedDigits of the number.
      #
      # Returns true if all digits are legible
      def valid?(digits)
        digits.all? { |d| d.legible? }
      end
    end
  end
end

