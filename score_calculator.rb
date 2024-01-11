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
      second_throw = @throws[throw_index + 1]
      display_frame_info(frame + 1, first_throw, second_throw)
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

  def display_frame_info(frame, first_throw, second_throw)
    pins_remaining = 10 - first_throw
    second_throw = [second_throw, pins_remaining].min
    puts "\nFrame #{frame}:"
    puts "Primer tiro: #{first_throw} | Segundo tiro: #{second_throw}"
  end

  def display_frame_score(total_score, frame_score = nil)
    frame_score_info = frame_score.nil? ? '' : "Puntuación de la ronda: #{frame_score} | "
    puts "#{frame_score_info} Puntuación total: #{total_score}"
  end
end
