require 'spec_helper'

module OCR
  describe ScannedNumber do
    context('with just one digit class') do
      Given(:lines) { ocr_number(:zeros) }
      When(:scanned_number) { OCR::ScannedNumber.new(*lines) }
      Then { scanned_number.value == '000000000' }
       And { scanned_number.valid? }
    end

    context('with each digit different') do
      Given(:lines) { ocr_number(:one_to_nine) }
      When(:scanned_number) { OCR::ScannedNumber.new(*lines) }
      Then { scanned_number.value == '123456789' }
       And { scanned_number.valid? }
    end

    context('with an invalid number') do
      Given(:lines) { ocr_number(:ones) }
      When(:scanned_number) { OCR::ScannedNumber.new(*lines) }
      Then { scanned_number.value == '111111111' }
       And { not scanned_number.valid? }
    end

    context('with an illegible digit') do
      Given(:lines) { ocr_number(:illegible_checksum) }
      When(:scanned_number) { OCR::ScannedNumber.new(*lines) }
      Then { scanned_number.value == '1???????2' }
       And { not scanned_number.legible? }
    end
  end
end

