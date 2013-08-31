require 'spec_helper'

describe BankOCRScanner do
  Given(:scanner) { BankOCRScanner.new }

  describe '#parse' do
    context 'with single entry' do
      context 'all 0s' do
        Given(:file) {
          StringIO.new(
            " _  _  _  _  _  _  _  _  _ \n" +
            "| || || || || || || || || |\n" +
            "|_||_||_||_||_||_||_||_||_|\n" +
            "\n"
          )
        }
        When(:result) { scanner.parse(file) }
        Then { result == '000000000' }
      end
    end
  end
end
