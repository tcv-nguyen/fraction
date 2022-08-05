require 'test_helper'
require 'fraction_calculation'

class FractionCalculationTest < ActiveSupport::TestCase
  # with valid input
  test 'input 1/2 * 3_3/4' do
    assert_equal calculate('1/2 * 3_3/4'), '1_7/8'
  end

  test 'input 2_3/8 + 9/8' do
    assert_equal calculate('2_3/8 + 9/8'), '3_1/2'
  end

  # with infraction
  test 'input 19/8 + 9/8' do
    assert_equal calculate('19/8 + 9/8'), '3_1/2'
  end

  test 'input 9/8 * 3' do
    assert_equal calculate('9/8 * 3'), '3_3/8'
  end

  # with invalid input
  test 'should return invalid message' do
    assert_equal calculate('23'), 'Invalid input'
  end

  # with negative result
  test 'input 1/2 - 3/4' do
    assert_equal calculate('1/2 - 3/4'), '-1/4'
  end

  test 'input 2_2/4 - 3_3/4' do
    assert_equal calculate('2_2/4 - 3_3/4'), '-1_1/4'
  end

  private
    def fraction
      @fraction ||= FractionCalculation.new
    end
  
    def calculate(input)
      fraction.process(input)
    end
end
