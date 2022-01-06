class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age:, name: 'Unknown', parent_permission: true)
    @id = Random.ran(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def of_age?
    (age > 18)
  end

  def can_use_services?
    age > 18 || parent_permission ? true : false
  end
end