module OCR
  module Validation
    class Checksum11 < Base
      def checksum(digits)
        digits.each_with_index do |digit, i|
          return digit.value.to_i * (9-i) if digit.value.to_i > 0
        end
        0
      end
    end
  end
end
