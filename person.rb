require_relative 'nameable'

class Person < Nameable # rubocop:todo Style/Documentation
  attr_accessor :id, :name, :age, :rentals
  attr_reader :parent_permission

  def initialize(age, name)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def rent_book(book, date)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    @age >= 18
  end
end
