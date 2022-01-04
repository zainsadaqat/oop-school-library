class Person
  attr_reader :id, :name, :age
  attr_writer :name, :age

  def initialize(name="Unknown", age, parent_permission=true)
    @id = Random.ran(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def is_of_age?
    (self.age > 18) ? true : false
  end

  def can_use_services?
    (self.age > 18 || self.parent_permission) ? true : false
  end
end
