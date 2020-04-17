# frozen_string_literal: true
require 'yaml'

class Ogre
  attr_accessor :strength, :speed, :smell
  def initialize(strength, speed, smell)
    @strength = strength
    @speed = speed
    @smell = smell
  end
end

class Dragon
  attr_accessor :strength, :speed, :color
  def initialize(strength, speed, color)
    @strength = strength
    @speed = speed
    @color = color
  end
end

class Fairy
  attr_accessor :strength, :speed, :intelligence
  def initialize(intelligence)
    @strength = 1
    @speed = 42
    @intelligence = intelligence
  end
end
class GameFile
  def initialize(file_name)
    @file = file_name
  end

  def write(yaml)
    save = File.open(@file, 'w')
    save.write yaml
    save.close
  end

  def read
    save = File.open(@file, 'r+')
    yaml = save.read
    save.close
    yaml
  end
end
def save_game(characters)
  yaml = YAML.dump(characters)
  save = GameFile.new('./save.yaml')
  save.write(yaml)
end

def load_game
  save = GameFile.new('./save.yaml')
  yaml = save.read
  YAML::load(yaml)
end

characters = [Ogre.new(5,3,6), Dragon.new(19,3,"black"),Fairy.new(99)]
save_game(characters)
p load_game
