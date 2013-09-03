require 'spec_helper'

# Internal: Shorthand to create Entry objects.
def E(n)
  BankOCRScanner::Entry.new(n)
end

describe BankOCRScanner do
  Given(:scanner) { BankOCRScanner.new }

  describe '#parse' do
    context 'with single entry' do
      context 'with 0s' do
        Given(:file) {
          StringIO.new(
            " _  _  _  _  _  _  _  _  _ \n" +
            "| || || || || || || || || |\n" +
            "|_||_||_||_||_||_||_||_||_|\n" +
            "\n"
          )
        }
        When(:result) { scanner.parse(file).to_a }
        Then { result == [E('000000000')] }
      end

      context 'with 1s' do
        Given(:file) {
          StringIO.new(
            "                           \n" +
            "  |  |  |  |  |  |  |  |  |\n" +
            "  |  |  |  |  |  |  |  |  |\n" +
            "\n"
          )
        }
        When(:result) { scanner.parse(file).to_a }
        Then { result == [E('111111111')] }
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
        Then { result == [E('001101100')] }
      end

      context 'with 2s' do
        Given(:file) {
          StringIO.new(
            " _  _  _  _  _  _  _  _  _ \n" +
            " _| _| _| _| _| _| _| _| _|\n" +
            "|_ |_ |_ |_ |_ |_ |_ |_ |_ \n" +
            "\n"
          )
        }
        When(:result) { scanner.parse(file).to_a }
        Then { result == [E('222222222')] }
      end

      context 'with 3s' do
        Given(:file) {
          StringIO.new(
            " _  _  _  _  _  _  _  _  _ \n" +
            " _| _| _| _| _| _| _| _| _|\n" +
            " _| _| _| _| _| _| _| _| _|\n" +
            "\n"
          )
        }
        When(:result) { scanner.parse(file).to_a }
        Then { result == [E('333333333')] }
      end

      context 'with 4s' do
        Given(:file) {
          StringIO.new(
            "                           \n" +
            "|_||_||_||_||_||_||_||_||_|\n" +
            "  |  |  |  |  |  |  |  |  |\n" +
            "\n"
          )
        }
        When(:result) { scanner.parse(file).to_a }
        Then { result == [E('444444444')] }
      end

      context 'with 5s' do
        Given(:file) {
          StringIO.new(
            " _  _  _  _  _  _  _  _  _ \n" +
            "|_ |_ |_ |_ |_ |_ |_ |_ |_ \n" +
            " _| _| _| _| _| _| _| _| _|\n" +
            "\n"
          )
        }
        When(:result) { scanner.parse(file).to_a }
        Then { result == [E('555555555')] }
      end

      context 'with 6s' do
        Given(:file) {
          StringIO.new(
            " _  _  _  _  _  _  _  _  _ \n" +
            "|_ |_ |_ |_ |_ |_ |_ |_ |_ \n" +
            "|_||_||_||_||_||_||_||_||_|\n" +
            "\n"
          )
        }
        When(:result) { scanner.parse(file).to_a }
        Then { result == [E('666666666')] }
      end

      context 'with 7s' do
        Given(:file) {
          StringIO.new(
            " _  _  _  _  _  _  _  _  _ \n" +
            "  |  |  |  |  |  |  |  |  |\n" +
            "  |  |  |  |  |  |  |  |  |\n" +
            "\n"
          )
        }
        When(:result) { scanner.parse(file).to_a }
        Then { result == [E('777777777')] }
      end

      context 'with 8s' do
        Given(:file) {
          StringIO.new(
            " _  _  _  _  _  _  _  _  _ \n" +
            "|_||_||_||_||_||_||_||_||_|\n" +
            "|_||_||_||_||_||_||_||_||_|\n" +
            "\n"
          )
        }
        When(:result) { scanner.parse(file).to_a }
        Then { result == [E('888888888')] }
      end

      context 'with 9s' do
        Given(:file) {
          StringIO.new(
            " _  _  _  _  _  _  _  _  _ \n" +
            "|_||_||_||_||_||_||_||_||_|\n" +
            " _| _| _| _| _| _| _| _| _|\n" +
            "\n"
          )
        }
        When(:result) { scanner.parse(file).to_a }
        Then { result == [E('999999999')] }
      end
    end

    context 'with multiple entries' do
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
      Then { result == [E('000000000'), E('111111111')] }
    end
  end

  describe BankOCRScanner::Entry do
    context 'with invalid checksum' do
      Given(:entry) { E('664371495') }
      Then { not entry.valid? }
    end

    context 'with valid checksum' do
      Given(:entry) { E('457508000') }
      Then { entry.valid? }
    end
  end
end
