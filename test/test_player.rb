# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'player'

# :reek:InstanceVariableAssumption
# Pruebas de la clase Player
class TestPlayer < Minitest::Test
  def setup
    @player = Player.new('Alice')
  end

  def test_name
    assert_equal 'Alice', @player.name
  end

  def test_throw_ball
    assert_includes 0..10, @player.throw_ball
  end
end
