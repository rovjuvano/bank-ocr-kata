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

      context 'all 1s' do
        Given(:file) {
          StringIO.new(
            "                           \n" +
            "  |  |  |  |  |  |  |  |  |\n" +
            "  |  |  |  |  |  |  |  |  |\n" +
            "\n"
          )
        }
        When(:result) { scanner.parse(file) }
        Then { result == '111111111' }
      end

      context 'with mixed digits' do
        Given(:file) {
          StringIO.new(
            " _  _        _        _  _ \n" +
            "| || |  |  || |  |  || || |\n" +
            "|_||_|  |  ||_|  |  ||_||_|\n" +
            "\n"
          )
        }
        When(:result) { scanner.parse(file) }
        Then { result == '001101100' }
      end
    end
  end
end
