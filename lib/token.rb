class Token
  def initialize(name)
    @name = name
  end

  def queen?
    name == "Q"
  end

  def empty?
    name == "_"
  end
  
  def to_s
    name
  end

  private

  attr_reader :name
end
