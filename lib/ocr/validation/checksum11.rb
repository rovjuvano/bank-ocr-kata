module OCR
  module Validation
    class Checksum11 < Base
      def valid?(digits)
        false
      end

      def checksum(digits)
        digits.each_with_index.inject(0) do |sum, (digit, i)|
          sum + digit.value.to_i * (9-i)
        end % 11
      end
    end
  end
end
