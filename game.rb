# frozen_string_literal: true

# Clase para definir al jugador, se ingresa un nombre como parametro.
class Player
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  # El método roll permite al objeto jugador obtener un número entre 0 y 10,
  # respresentando a los pinos que derriba.
  def roll
    rand(0..pines) # Se genera un número aleatorio entre 0 y 10.
  end
end

# Clase para definir los pinos. Automáticamente se inicializan con 10 pinos.
class Pin
  attr_accessor :quantity

  def initialize
    @quantity = 10
  end

  # Nos muestra la cantidad de pinos actuales de la ronda.
  def show_pins
    @quantity
  end

  # Resta la cantidad de pinos que el jugador derribo.
  def update_pins(pins_knocked_down)
    @quantity -= pins_knocked_down
    puts "Pinos restantes: #{@quantity}"
  end

  # Reinicia el valor inicial de los pinos al inicio de cada ronda del jugador.
  def reset_pins
    @quantity = 10
  end
end

# Clase para añadir los puntajes del jugador en caso de hacer un strike o spare,
# además de calcular su puntaje final.
class Score
  attr_accessor :score

  # Cada jugador incia con un puntaje de 0 y con un array que guardará sus spares o strikes.
  def initialize
    @score = 0
    @bonuses = []
  end

  # Permite obtener el puntaje final de cada jugador.
  def calculate_score
    @score = 0
    @bonuses.each { |bonus| @score += bonus } # Se suma cada elemento del array "bonuses" a la variable score.
    puts "Puntaje total: #{@score}"
  end

  # Se añaden los spare al array bonuses.
  def spare(pins_knocked_down)
    @bonuses << pins_knocked_down
  end

  # Se ingresan los parametros correspondientes al tiro 1 y 2 del jugador, para posteriormente sumarse
  # y añadir el nuevo valor al array.
  def strike(roll1, roll2)
    @bonuses << roll1 + roll2
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
