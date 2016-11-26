require_relative 'combatable'

# This is the player
class Player
  include Combatable
  attr_accessor :x_coord, :y_coord
  MAX_HIT_POINTS = 100

  def initialize
    initialize_stats(BASE_STATS.merge ({
      max_hit_points: MAX_HIT_POINTS
    }))
    @x_coord = 0
    @y_coord = 0
  end

  def print_status
    puts '*' * 80
    puts "HP: #{@hit_points}/#{MAX_HIT_POINTS}"
    puts "AP: #{@attack_power}"
    puts '*' * 80
  end
end
