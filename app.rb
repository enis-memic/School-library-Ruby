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
require_relative 'save_data'

class App
  attr_accessor :books, :rentals, :people

  include ModBook
  include ModPeople
  include ModRentals

  def initialize
    @books = ReadData.new.read_books
    @rentals = []
    @people = []
  end

  def quit_app
  SaveData.new.save_books(@books)
  puts 'Thank you for using this app! Now exiting...'
  exit
  end

end
