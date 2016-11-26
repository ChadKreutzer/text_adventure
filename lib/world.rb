# Define the World
class World
  WORLD_WIDTH = rand(50)
  WORLD_HEIGHT = rand(50)

  def initialize
    @rooms = Array.new(WORLD_HEIGHT) { Array.new(WORLD_WIDTH) { Room.new } }
  end

  def move_entity_north(entity)
    if entity.y_coord > 0
      entity.y_coord -= 1
    else
      world_edge
    end
  end

  def move_entity_south(entity)
    if entity.y_coord < WORLD_HEIGHT - 1
      entity.y_coord += 1
    else
      world_edge
    end
  end

  def move_entity_east(entity)
    if entity.x_coord < WORLD_HEIGHT - 1
      entity.x_coord += 1
    else
      world_edge
    end
  end

  def move_entity_west(entity)
    if entity.x_coord > 0
      entity.x_coord -= 1
    else
      world_edge
    end
  end

  def get_room_of(entity)
    @rooms[entity.x_coord][entity.y_coord]
  end

  def world_edge
    puts "You can't go that direction"
  end
end
