module OCR
  module Validation
    # Public: A checkum based validation strategy.
    class Checksum11 < Base
      # Override
      def valid?(digits)
        super(digits) && checksum(digits) == 0
      end

      # Internal: Calculate checksum used in validation.
      #
      # digits - see #valid?
      #
      # SUM(digits[i] * (9 - i)) % 11 for i in 0 to 8
      #
      # Returns the Integer checksum.
      def checksum(digits)
        digits.each_with_index.inject(0) do |sum, (digit, i)|
          sum + digit.value.to_i * (9-i)
        end % 11
      end
    end
  end
end
