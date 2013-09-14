module OCR
  module Guessing
    module Digit
      class BitFlipper < Base
        def guesses(line1, line2, line3)
          a = [line1, line2, line3]
          OCR::ScannedDigit::TO_DIGIT.keys.collect do |b|
            b.scan(/.../)
          end.select do |b|
            differences(a, b) == 1
          end.collect do |b|
            OCR::ScannedDigit.new(*b)
          end
        end

        def differences(a, b)
          as = a.join('')
          bs = b.join('')
          (0..9).count { |i| as[i] != bs[i] }
        end
      end
    end
  end
end
