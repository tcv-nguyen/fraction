require 'thor'

class FractionCalculation < Thor
  def initialize(params = nil)
    introduction if params.nil? # Skip introduction when User already know what to input
    input = params || get_input
    @array = input.split(' ')
  end

  def run!
    if @array.size != 3
      'Invalid input'
    else
      fraction = calculate(@array)
      display_fraction(fraction)
    end
  end

  private
    def introduction
      puts 'Fraction calculation'
      puts '
        - Legal operators shall be *, /, +, - (multiply, divide, add, subtract)
        - Operands and operators shall be separated by one or more spaces
        - Mixed numbers will be represented by whole_numerator/denominator. e.g. "3_1/4"
        - Improper fractions and whole numbers are also allowed as operands
 
        Example:
          1/2 * 3_3/4
          2_3/8 + 9/8
      '
    end

    def get_input
      ask('> Enter formula:')
    end

    def calculate(array)
      number_1, operator, number_2 = array
      # Loop through numbers and convert mixed numbers if any
      # Then use #inject to execute the operator (*, /, +, -)
      [number_1, number_2].map { |n| convert_to_fraction(n) }.inject(operator.to_sym) # or use .inject(:"#{o}")
    end

    def convert_to_fraction(string)
      string.split('_').map { |n| Rational(n) }.inject(:+)
    end

    def display_fraction(fraction)
      top, bottom = fraction.to_s.split('/').map(&:to_i)
      return fraction.to_s if top < bottom
      # Get whole divition and mod divition and display into format
      "#{top / bottom}_#{top % bottom}/#{bottom}"
    end
end