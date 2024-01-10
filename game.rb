# frozen_string_literal: true

# Clase para definir al jugador
class Player
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def throw(pines)
    fall = rand(0..pines)
  end
end

# Clase para definir los pinos
class Pine
  attr_accessor :quantity

  def initialize
    @quantity = 10
  end

  def show_pines
    @quantity
  end

  def update_pines(pines)
    @quantity -= pines
    puts "#{@quantity}"
  end
  def restart_pines
    @quantity = 10
  end
end

# ! Clase para algoritmo de puntaje puntaje
class Score
  attr_accessor :score 
  
  def initialize 
    @score = 0
  end

  def spare
  end

  def strike
  end
end

# ! Clase para mostrar el resultado
class Board
  attr_accessor
end

# ! Clase para iniciar el juego
class Game
end
player = Player.new('will')
pine = Pine.new

roll = player.throw(pine.show_pines)
puts roll
pine.update_pines(roll)

