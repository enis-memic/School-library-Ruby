require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'classroom'
require_relative 'person'
require_relative 'modules/mod_book'
require_relative 'modules/mod_people'
require_relative 'modules/mod_rentals'

class App
  attr_accessor :books, :rentals, :people

  include ModBook
  include ModPeople
  include ModRentals

  def initialize
    @books = []
    @rentals = []
    @people = []
  end
end
