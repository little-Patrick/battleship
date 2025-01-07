class Ship
    attr_reader :name, :health, :length, :sunk

    def initialize(name, health)
        @name = name
        @health = health
        @length = health
        @sunk = false
    end

    def sunk?
        if @health == 0
            @sunk = true
        end
        @sunk
    end

    def hit
        @health -= 1
    end

    def repair
        @health = @length
        @sunk = false
    end
end