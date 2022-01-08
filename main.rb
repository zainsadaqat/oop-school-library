require './book'
require './classroom'
require './corrector_class'
require './person_class'
require './rental'
require './teacher_class'
require './student_class'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
    @options = {
      '1' => 'List all books',
      '2' => 'List all people',
      '3' => 'Create a person',
      '4' => 'Create a book',
      '5' => 'Create a rental',
      '6' => 'List all rentals for a given person',
      '7' => 'Exit'
    }
  end

  def run
    puts '>>>>>>>>>>>>> Welcome to OOP School Library <<<<<<<<<<<<<'

    loop do
      puts ''
      puts 'Please select an option by entering corresponding number to the given list of values'
      @options.each { |key, value| puts "#{key} - #{value}" }
      option = gets.chomp
      break if option.eql?('7')

      puts "\nYou selected: #{option}\n"

      menu(option)
    end
  end

  def menu(option)
    case option
    when '1'
      books
    when '2'
      people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      rentals
    else
      puts 'Please select a valid option'
    end
  end

  private

  def books
    if @books.empty?
      puts "\nLibrary is empty"
    else
      @books.each { |book| puts book }
    end
  end

  def people
    if @people.empty?
      puts "\nNobody registered here ..."
    else
      @people.each { |person| puts person }
    end
  end

  def create_person
    puts "\nDo you want to create a student (1) or a teacher (2)? [Input the number]: "
    option = gets.chomp
    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Please enter a valid option'
    end
    person = option == '1' ? 'Student' : 'Teacher'
    puts "#{person} successfully created!"
  end

  def create_student
    puts "\nPlease enter the asked values\n"
    puts "\nYour age: "
    age = gets.chomp
    puts "\nYour name: "
    name = gets.chomp
    puts "\nHas parent permission? [Y/N]"
    permission = gets.chomp
    @people.push(Student.new(name: name, age: age, parent_permission: translate_answer(permission.downcase)))
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @people.push(Teacher.new(name: name, age: age, specialization: specialization))
  end

  def translate_answer(answer)
    %w[yes y].include?(answer)
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books.push(Book.new(title, author))
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) #{book}" }
    book_i = gets.chomp
    puts ''
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index { |person, index| puts "#{index}) #{person}" }
    person_i = gets.chomp
    puts ''
    print 'Date: '
    date = gets.chomp
    @rentals.push(Rental.new(date, @books[book_i.to_i], @people[person_i.to_i]))
    puts 'Rental created successfully'
  end

  def rentals
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index { |person, index| puts "#{index}) #{person}" }
    person_i = gets.chomp
    puts ''
    puts 'Rentals:'
    @rentals.each { |rental| puts rental if rental.person.id == @people[person_i.to_i].id }
  end
end

def main
  app = App.new
  app.run
end

main
