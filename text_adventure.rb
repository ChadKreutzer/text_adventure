Dir['lib/**.*'].each { |file| require_relative file }

# This is the Main Game
class Game
  ACTIONS = [
    :north, :east, :south, :west, :look, :fight, :take, :status, :quit
  ].freeze

  def initialize
    @world = World.new
    @player = Player.new

    start_game
  end

  private

  def start_game
    while @player.alive?
      @current_room = @world.get_room_of(@player)

      print_status

      action = take_player_input
      next unless ACTIONS.include? action

      take_action(action)
    end
  end

  def take_player_input
    print "What's the plan, stan? >"
    gets.chomp.to_sym
  end

  def print_status
    puts "You are at map coordinates [#{@player.x_coord}, #{@player.y_coord}]"

    puts @current_room
    puts "You see #{@current_room.content}." if @current_room.content
  end

  def take_action(action)
    case action
    when :look, :status
      status_update(action)
    when :north, :south, :east, :west
      move(action)
    when :fight, :take
      @current_room.interact(@player)
    when :quit
      exit
    end
  end

  def move(direction)
    case direction
    when :north
      @world.move_entity_north(@player)
    when :east
      @world.move_entity_east(@player)
    when :south
      @world.move_entity_south(@player)
    when :west
      @world.move_entity_west(@player)
    end
  end

  def status_update(asses)
    asses == :look ? print_status : @player.print_status
  end
end

Game.new
