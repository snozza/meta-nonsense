class Student

  attr_accessor :badges

  def initialize
    @badges = []
  end

  def method_missing(name)
    if name.to_s =~ /^has_(.+?)\?/
      self.class.send(:define_method, name) do
        return @badges.include? $1.to_sym : true ? false   
      end
      self.send(name)
    else
      super
    end
  end

def respond_to?(name)
  name =~ /^has_.+?\?/ ? true : super
end

  def award(badge)
    @badges << badge
  end

end
