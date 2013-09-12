require 'spec_helper'

module OCR
  describe OCRFile do
    context('with a single entry') do
      Given(:file) {
        StringIO.new(
          ' _  _  _  _  _  _  _  _  _ \n' +
          '| || || || || || || || || |\n' +
          '|_||_||_||_||_||_||_||_||_|\n' +
          '\n'
        )
      }
      When(:values) { OCRFile.new(file).entries.collect { |n| n.value } }
      Then { values == ['000000000'] }
    end
  end
end
