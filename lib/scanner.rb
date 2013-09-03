# Public: Code to parse OCR data
class BankOCRScanner
  # Public: Parse OCR file into account numbers.
  #
  # io - The file, etc. from which to read the OCR data.
  #
  # Returns Enumerator of Entry objects.
  def parse(io)
    Enumerator.new do |y|
      entries(io).each do |entry|
        y << Entry.new( parse_entry(entry) )
      end
    end
  end

  private
  # Internal: Parse a single OCR entry into an account number.
  #
  # entry - The three line OCR representation of an account number.
  #
  # Returns the String representation of the OCR entry.
  def parse_entry(entry)
    digits(entry).collect() do |d|
      parse_digit(d)
    end.join('')
  end

  # Internal: The lookup table for #parse_digit.
  DIGITS = {
    ' _ | ||_|' => '0',
    '     |  |' => '1',
    ' _  _||_ ' => '2',
    ' _  _| _|' => '3',
    '   |_|  |' => '4',
    ' _ |_  _|' => '5',
    ' _ |_ |_|' => '6',
    ' _   |  |' => '7',
    ' _ |_||_|' => '8',
    ' _ |_| _|' => '9',
  }
  # Internal: Parse a single digit of OCR data into a string
  #
  # digit - The three line OCR representation of a single digit.
  #
  # Returns the String representation of the digit.
  def parse_digit(digit)
    DIGITS[digit.join('')]
  end

  # Internal: Split OCR input file into OCR entries.
  #
  # io - The file, etc. from which to read.
  #
  # Returns the Enumerator of OCR entries.
  def entries(io)
    Enumerator.new do |y|
      until io.eof?
        y << io.gets('')
      end
    end
  end

  # Internal: Split an OCR entry into OCR digits.
  #
  # entry - The three line OCR representation of an account number.
  #
  # Returns the Enumerator of OCR digits.
  def digits(entry)
    Enumerator.new do |y|
      (0...27).step(3) do |base|
        y << [
          entry[base,    3],
          entry[base+28, 3],
          entry[base+56, 3]
        ]
      end
    end
  end

  # Public: A Value Object representing the OCR data.
  class Entry
    attr_reader :number

    # Public: Initialize an Entry of OCR parsed data.
    #
    # number - The String representation of the OCR data.
    def initialize(number)
      @number = number
    end

    # Override. This is a value object.
    def ==(other)
      @number == other.number
    end

    # Public: Verify whether entry could be assigned as an account number.
    #
    # Returns true iff number is in the set of valid account numbers.
    def valid?()
      legible? &&
      1.upto(9).inject(0) do |sum, i|
        sum + @number[9-i].to_i * i
      end % 11 == 0
    end

    # Public: Verify whether entry contains only readable digits
    #
    # Returns true iff every digit could be identified
    def legible?()
      number !~ /\?/
    end
  end
end
