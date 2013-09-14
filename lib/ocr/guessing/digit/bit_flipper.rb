module OCR
  module Guessing
    module Digit
      class BitFlipper
        def differences(a, b)
          a.join('') == b.join('') ? 0 : 1
        end
      end
    end
  end
end
