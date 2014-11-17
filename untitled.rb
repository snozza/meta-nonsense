can overwrite method_messing in ruby


class Something

    def method_missing(name, *args)
        puts "This method isn't really missing"
        puts args.to_s
        block.call
        puts "It's ok #{name} is the method you called"
    end

end

duck = Duck.new
duck.quack(2){puts "quack"}


att_accessor :method_one

def method_one
  @method_one
end

def method_one=(value)
end


class Student

  def initialize
    @badges = []
  end

  def award(badge)
    @badges << badge
  end

end
