# frozen_string_literal: true

require_relative 'score_calculator'
require_relative 'player'

# inicializa el juego
class Game
  def initialize
    @throws = []
  end

  def throw_ball(pins_knocked_down)
    @throws << pins_knocked_down
  end

  def calculate_score
    score_calculator = ScoreCalculator.new(@throws)
    score_calculator.calculate_score
  end
end

# Ejemplo de uso con tiros generados aleatoriamente
game = Game.new
jugador1 = Player.new('fernando')
10.times do
  first_throw = rand(0..10)
  second_throw = rand(0..(10 - first_throw))
  game.throw_ball(first_throw)
  game.throw_ball(second_throw)
end
# Añadir tiros adicionales para la última ronda
game.throw_ball(rand(0..10)) # Tiro adicional para la última ronda
game.throw_ball(rand(0..10)) # Tiro adicional para la última ronda
# Calcular y mostrar la puntuación final
puts "\nJugador ganador: #{jugador1.name} \nPuntuación Final: #{game.calculate_score}"
