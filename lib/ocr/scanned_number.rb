module OCR
  # Public: Encapsulate a single number/entry from an OCR file.
  class ScannedNumber
    # Public: Initialize a single number/entry from the three lines of OCR data.
    #
    # line1 - The top line of the digits.
    # line2 - The middle line of the digits.
    # line3 - The bottom line of the digits.
    def initialize(line1, line2, line3)
      @lines = [line1, line2, line3]
    end

    # Public: Get the String representation of the number/entry.
    #
    # Returns the String representation of the number/entry.
    def value
      digits.collect { |digit| digit.value }.join('')
    end

    # Public: Indicate whether number is among the valid set of account numbers.
    #
    # Returns true iff the number is a member of the set of valid account numbers.
    def valid?()
      legible? &&
      (@@validator ||= OCR::Validation::Checksum11.new).valid?(digits)
    end

    # Public: Flag whether entire number is legible
    #
    # Returns true if every digit could be recognized
    def legible?()
      digits.all? { |d| d.legible? }
    end

    protected
      # Internal: Split lines into single digits.
      #
      # Returns the Enumerable of ScannedDigits.
      def digits()
        (0...27).step(3).collect do |base|
          ScannedDigit.new(@lines[0][base, 3],
                           @lines[1][base, 3],
                           @lines[2][base, 3])
        end
      end
  end
end
