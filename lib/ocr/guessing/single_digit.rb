module OCR
  module Guessing
    class SingleDigit < Base
      def guesses(number)
        source_digits = number.digits.to_a
        guessed_digits = []
        guesses = []

        source_digits.each_with_index do |digit, i|
          digit.guesses.each do |guessed_digit|
            guessed_digits.replace(source_digits)
            guessed_digits[i] = guessed_digit
            if validator.valid?(guessed_digits)
              guesses << guessed_digits.collect { |d| d.value }.join('')
            end
          end
        end

        guesses
      end

      protected
        def validator
          (@@validator ||= Validation::Checksum11.new)
        end
    end
  end
end
