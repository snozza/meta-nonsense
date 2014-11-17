class Student

  attr_accessor :badges

  def initialize
    @badges = []
  end

  def method_missing(name)
    if name.to_s =~ /^has_(.+?)\?/
      self.class.send(:define_method, name) {@badges.include?($1.to_sym) ? true : false}
      self.send(name)         
    else
      super
    end
  end

end
