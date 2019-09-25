class Chameleon

    @color = "yellow"
    def initialize
        @color = "yellow"
        puts "cham is created" + @color.to_s
    end

    def set_color(color)
        @color = color
    end

    def print()
        puts @color
    end 

end


class Person
    # @FirstName
    # @LastName
    
    def initialize(firstname, lastname)
        @FirstName = firstname
        @LastName = lastname
    end

    def to_s
        return @FirstName.to_s + " " + @LastName.to_s
    end

end


cham = Chameleon.new
cham.print
cham.set_color("red")
cham.print


person = Person.new("Oleg", "Pozovnoy")
puts person.to_s
