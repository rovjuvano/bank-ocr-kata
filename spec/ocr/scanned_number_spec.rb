require 'spec_helper'

module OCR
  describe ScannedNumber do
    context('with just one digit class') do
      Given(:lines) { [
        ' _  _  _  _  _  _  _  _  _ ',
        '| || || || || || || || || |',
        '|_||_||_||_||_||_||_||_||_|'
      ] }
      When(:scanned_number) { OCR::ScannedNumber.new(*lines) }
      Then { scanned_number.value == '000000000' }
    end

    context('with two digit classes') do
      Given(:lines) { [
        ' _     _     _     _     _ ',
        '| |  || |  || |  || |  || |',
        '|_|  ||_|  ||_|  ||_|  ||_|'
      ] }
      When(:scanned_number) { OCR::ScannedNumber.new(*lines) }
      Then { scanned_number.value == '010101010' }
    end
  end
end

