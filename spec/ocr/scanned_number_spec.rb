require 'spec_helper'

module OCR
  describe ScannedNumber do
    Given(:scanned_number) { ocr_scanned_number(number) }

    context('with just one digit class') do
      Given(:number) { :zeros }
      Then { scanned_number.value == '000000000' }
       And { scanned_number.valid? }
       And { scanned_number.legible? }
    end

    context('with each digit different') do
      Given(:number) { :one_to_nine }
      Then { scanned_number.value == '123456789' }
       And { scanned_number.valid? }
       And { scanned_number.legible? }
    end

    context('with an invalid number') do
      Given(:number) { :ones }
      Then { scanned_number.value == '111111111' }
       And { not scanned_number.valid? }
       And { scanned_number.legible? }
    end

    context('with an illegible digit') do
      Given(:number) { :illegible_checksum }
      Then { scanned_number.value == '1???????2' }
       And { not scanned_number.valid? }
       And { not scanned_number.legible? }
    end

    describe '#digits' do
      Given(:number) { :one_to_nine }
      Given(:expected) { ocr_digits('123456789') }
      Then { scanned_number.digits.to_a == expected }
    end
  end
end

