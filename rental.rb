class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @data = date
    @book = book
    @person = person
  end
end
