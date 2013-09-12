module OCR
  class OCRFile
    def initialize(file)
    end

    # Public: Split OCR file into single numbers/entries
    #
    # Returns the Enumerator of ScannedNumbers
    def entries()
      Enumerator.new do |y|
        y << ScannedNumber.new(
          ' _  _  _  _  _  _  _  _  _ ',
          '| || || || || || || || || |',
          '|_||_||_||_||_||_||_||_||_|'
        )
      end
    end
  end
end
