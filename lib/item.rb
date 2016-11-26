# These are the items
class Item
  def interact(player)
    puts "You pick up #{self}"

    perform_item_effect(player)
  end

  def to_s
    "a shiny awesome #{@name}"
  end
end

# Potions to heal you
class Potion < Item
  def initialize
    @name = 'potion'
  end

  def perform_item_effect(player)
    player.heal(10)
  end
end

# Swords make you stronger
class Sword < Item
  def initialize
    @name = 'sword'
  end

  def perform_item_effect(player)
    player.attack_power += 1
  end
end
