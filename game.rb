# frozen_string_literal: true

# Clase para definir al jugador
class Player
  attr_accesor :name

  def initialize(name)
    @name = name
  end

  def throw(pines)
    fall = rand(1..pines)
  end
end

# Clase para definir los pinos
class Pine
  attr_accesor :quantity

  def initialize
    @quantity = 10
  end

  def show_pines
    @quantity
  end

  def update_pines(pines)
    @quantity -= pines
  end
end
