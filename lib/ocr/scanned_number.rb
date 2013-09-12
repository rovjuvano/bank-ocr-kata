module OCR
  class ScannedNumber
    def initialize(line1, line2, line3)
      @lines = [line1, line2, line3]
    end

    def value
      digits.collect { |digit| digit.value }.join('')
    end

    protected
      def digits()
        (0..27).step(3).collect do |base|
          ScannedDigit.new(@lines[0][base, 3],
                           @lines[1][base, 3],
                           @lines[2][base, 3])
        end
      end
  end
end
