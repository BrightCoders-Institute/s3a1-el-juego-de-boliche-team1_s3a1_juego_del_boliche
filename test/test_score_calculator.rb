# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'score_calculator'

# Pruebas de la clase Score Calculator
class TestScoreCalculator < Minitest::Test
  def test_calculate_score_strike
    throws = [10, 3, 4] + [0] * 17
    calculator = ScoreCalculator.new(throws)
    assert_equal 24, calculator.calculate_score
  end

  def test_calculate_score_spare
    throws = [5, 5, 3] + [0] * 17
    calculator = ScoreCalculator.new(throws)
    assert_equal 16, calculator.calculate_score
  end

  def test_calculate_score_normal
    throws = [3, 4] + [0] * 18
    calculator = ScoreCalculator.new(throws)
    assert_equal 7, calculator.calculate_score
  end
end
