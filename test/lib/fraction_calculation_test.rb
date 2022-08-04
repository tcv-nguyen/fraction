require 'test_helper'
require 'fraction_calculation'

class FractionCalculationTest < ActiveSupport::TestCase
  # with valid input
  test 'input 1/2 * 3_3/4' do
    assert_equal fraction('1/2 * 3_3/4'), '1_7/8'
  end

  test 'input 2_3/8 + 9/8' do
    assert_equal fraction('2_3/8 + 9/8'), '3_1/2'
  end

  # with infraction
  test 'input 19/8 + 9/8' do
    assert_equal fraction('19/8 + 9/8'), '3_1/2'
  end

  test 'input 9/8 * 3' do
    assert_equal fraction('9/8 * 3'), '3_3/8'
  end

  # with invalid input
  test 'should return invalid message' do
    assert_equal fraction('23'), 'Invalid input'
  end

  private
    def fraction(input)
      FractionCalculation.new(input).run!
    end
end
