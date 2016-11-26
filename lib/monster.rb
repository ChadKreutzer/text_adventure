require_relative 'combatable'
# This is the monsters
class Monster
  include Combatable

  MAX_HIT_POINTS = 10

  def initialize
    initialize_stats(BASE_STATS.merge(max_hit_points: MAX_HIT_POINTS))
  end

  def to_s
    'A horrible monster! Garurururu'
  end

  def interact(player)
    while player.alive?
      puts "You hit the monster for #{player.attack_power} points."
      hurt(player.attack_power)
      break unless alive?
      player.hurt(@attack_power)
      puts "The monster hits you for #{attack_power} points."
    end
  end
end
