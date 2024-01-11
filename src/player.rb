# frozen_string_literal: true

# Clase para definir al jugador
class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def throw_ball
    rand(0..10)
  end
end
