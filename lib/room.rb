# Describe the Rooms
class Room
  attr_accessor :size, :content

  def initialize
    @content = contents
    @size = sizes
    @adjective = adjectives
  end

  def interact(player)
    @content.interact(player) if @content
    @content = nil
  end

  def to_s
    "You are in a #{@size} room. It is #{@adjective}."
  end

  private

  def contents
    [Monster, Potion, Sword].sample.new
  end

  def sizes
    %w(small medium large).sample
  end

  def adjectives
    %w(pretty ugly hideous).sample
  end
end
