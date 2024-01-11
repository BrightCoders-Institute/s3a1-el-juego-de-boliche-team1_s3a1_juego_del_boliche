# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'game'

# Pruebas de la clase Game
class TestGame < Minitest::Test
  def setup
    @game = Game.new
  end

  def test_throw_ball
    @game.throw_ball(5)
    assert_equal [5], @game.instance_variable_get(:@throws)
  end

  def test_calculate_score
    20.times { @game.throw_ball(1) }
    assert_equal 20, @game.calculate_score
  end
end
