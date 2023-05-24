require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'classroom'
require_relative 'person'
require_relative 'modules/mod_book'
require_relative 'modules/mod_people'
require_relative 'modules/mod_rentals'
require_relative 'read_data'

class App # rubocop:todo Style/Documentation
  attr_accessor :books, :rentals, :people

  include ModBook
  include ModPeople
  include ModRentals

  def initialize
    @books = ReadData.new.read_books
    @people = ReadData.new.read_people
    @rentals = ReadData.new.read_rentals(@books, @people)
  end
end
