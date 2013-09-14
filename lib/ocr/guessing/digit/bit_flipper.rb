module OCR
  module Guessing
    module Digit
      class BitFlipper < Base
        def guesses(line1, line2, line3)
          a = [line1, line2, line3]
          line = OCR::ScannedDigit::TO_DIGIT.keys.find do |b|
            differences(a, b.scan(/.../)) == 1
          end
          line ? [ OCR::ScannedDigit.new(*line.scan(/.../)) ] : []
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
