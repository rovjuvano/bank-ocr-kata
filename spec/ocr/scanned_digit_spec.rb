require 'spec_helper'

module OCR
  describe ScannedDigit do
    context('with valid pattern') do
      Given(:lines) {[
        ' _ ',
        '| |',
        '|_|'
      ]}
      When(:digit) { ScannedDigit.new(*lines) }
      Then { digit.value == '0' }
    end
  end
end
