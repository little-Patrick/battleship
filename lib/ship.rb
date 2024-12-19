class Ship
    attr_reader :name, :health, :length, :sunk

    def initialize(name, health)
        @name = name
        @health = health
        @length = health
        @sunk = false
    end


end