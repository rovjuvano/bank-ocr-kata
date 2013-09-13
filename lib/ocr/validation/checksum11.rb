module OCR
  module Validation
    class Checksum11 < Base
      def checksum(digits)
        digits.each_with_index.inject(0) do |sum, (digit, i)|
          sum + digit.value.to_i * (9-i)
        end
      end
    end
  end
end
