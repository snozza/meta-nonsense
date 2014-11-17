class Student

  attr_reader :badges

  def initialize
    @badges = []
  end

  def method_missing(name)
    if name.to_s =~ /^has_(.+?)\?/
      self.class.send(:define_method, name) do
        @badges.include?($1.to_sym) ? true : false   
      end
      self.send(name)
    else
      super
    end
  end

  def award(badge)
    @badges << badge
  end

end
