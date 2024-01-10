# frozen_string_literal: true

class Player
  attr_accessor :name
  def initialize(name)
    @name = name
  end
  def throw_ball
    rand(0..10)
  end
end

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

class ScoreCalculator
  def initialize(throws)
    @throws = throws
  end
  def calculate_score
    frame = 0
    throw_index = 0
    total_score = 0
    while frame < 10
      first_throw = @throws[throw_index]
      pins_remaining = 10 - first_throw
      second_throw = @throws[throw_index + 1]
      display_frame_info(frame + 1, first_throw, pins_remaining, second_throw)
      if strike?(throw_index)
        total_score += 10 + bonus_strike(throw_index)
        display_frame_score(total_score)
        throw_index += 1
      elsif spare?(throw_index)
        total_score += 10 + bonus_spare(throw_index)
        display_frame_score(total_score)
        throw_index += 2
      else
        frame_score = sum_throws(throw_index)
        total_score += frame_score
        display_frame_score(total_score, frame_score)
        throw_index += 2
      end
      frame += 1
    end
    total_score
  end
  private
  def strike?(throw_index)
    @throws[throw_index] == 10
  end
  def spare?(throw_index)
    sum_throws(throw_index) == 10
  end
  def bonus_strike(throw_index)
    @throws[throw_index + 1] + (@throws[throw_index + 2] || 0)
  end
  def bonus_spare(throw_index)
    @throws[throw_index + 2] || 0
  end
  def sum_throws(throw_index)
    (@throws[throw_index] || 0) + (@throws[throw_index + 1] || 0)
  end
  def display_frame_info(frame, first_throw, pins_remaining, second_throw)
    puts "\nFrame #{frame}:"
    puts "Primer tiro: #{first_throw} | Pinos restantes: #{pins_remaining} | Segundo tiro: #{second_throw}"
  end
  def display_frame_score(total_score, frame_score = nil)
    frame_score_info = frame_score.nil? ? '' : "Puntuación de la ronda: #{frame_score} | "
    puts "#{frame_score_info} Puntuación total: #{total_score}"
  end
end

# Ejemplo de uso con tiros generados aleatoriamente
game = Game.new
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
puts "\nPuntuación Final: #{game.calculate_score}"