require 'spec_helper'

module OCR
  describe ScannedDigit do
    context('when pattern represents 0') do
      Given(:lines) {[
        ' _ ',
        '| |',
        '|_|'
      ]}
      When(:digit) { ScannedDigit.new(*lines) }
      Then { digit.value == '0' }
    end

    context('when pattern represents 1') do
      Given(:lines) {[
        '   ',
        '  |',
        '  |'
      ]}
      When(:digit) { ScannedDigit.new(*lines) }
      Then { digit.value == '1' }
    end
  end
end
