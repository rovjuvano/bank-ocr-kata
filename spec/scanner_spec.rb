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
        When(:result) { scanner.parse(file).to_a }
        Then { result == ['000000000'] }
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
        When(:result) { scanner.parse(file).to_a }
        Then { result == ['111111111'] }
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
        When(:result) { scanner.parse(file).to_a }
        Then { result == ['001101100'] }
      end

      context 'all 2s' do
        Given(:file) {
          StringIO.new(
            " _  _  _  _  _  _  _  _  _ \n" +
            " _| _| _| _| _| _| _| _| _|\n" +
            "|_ |_ |_ |_ |_ |_ |_ |_ |_ \n" +
            "\n"
          )
        }
        When(:result) { scanner.parse(file).to_a }
        Then { result == ['222222222'] }
      end
    end

    context 'multiple entries' do
      Given(:file) {
        StringIO.new(
            " _  _  _  _  _  _  _  _  _ \n" +
            "| || || || || || || || || |\n" +
            "|_||_||_||_||_||_||_||_||_|\n" +
            "\n" +
            "                           \n" +
            "  |  |  |  |  |  |  |  |  |\n" +
            "  |  |  |  |  |  |  |  |  |\n" +
            "\n"
        )
      }
      When(:result) { scanner.parse(file).to_a }
      Then { result == ['000000000', '111111111'] }
    end
  end
end
