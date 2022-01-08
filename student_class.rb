class Student < Person
  attr_reader :classroom

  def initialize(name: 'Unknown', age: 0, parent_permission: true, classroom: 'None')
    super(age: age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
