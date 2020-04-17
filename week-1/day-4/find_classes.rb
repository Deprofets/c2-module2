# frozen_string_literal: true

# A Blackboard. You can leave your mark
class Blackboard
  # @param [Integer] size The screen size in inches
  # @param [String] marker_color The color of the marker to use in this Blackboard
  def initialize(size, marker_color)
    @size = size
    @marker_color = marker_color
  end

  # Draws something on the Blackboard
  def draw
    p "You try to draw something, it doesn't come out as you expected"
  end

  # Clears the blackboard
  def clear
    p 'You decide to clear the blackboard, someone might need to use it later'
  end
end

# A TV, without signal
class TV
  def initialize(size)
    @size = size
    @state = :powered_off
  end

  private

  # Powers up the TV
  def power_up
    @state = :powered_up
    p 'You see some static noise on the screen'
  end

  # Shut downs the TV
  def power_down
    @state = :powered_off
    p 'The sreen went black'
  end
end

# A remote to control your TV
class Remote
  # @param [TV] television A Television
  def initialize(television)
    @tv = television
  end

  # Sends a signal to the TV to power up
  def power_up
    @tv.send :power_up
  end

  # Sends a signal to the TV to power down
  def power_down
    @tv.send :power_down
  end
end

blackboard = Blackboard.new(32, "blue")
tv = TV.new 40
remote = Remote.new tv

blackboard.draw
blackboard.clear
remote.power_up
remote.power_down
