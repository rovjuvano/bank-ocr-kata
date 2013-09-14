module OCR
  module Guessing
    module Digit
      class BitFlipper
        def differences(a, b)
          as = a.join('')
          bs = b.join('')
          (0..9).count { |i| as[i] != bs[i] }
        end
      end
    end
  end
end
