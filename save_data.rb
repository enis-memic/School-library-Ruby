require 'json'
require 'fileutils'

class SaveData
  def check_file_exist(filename)
    FileUtils.mkdir_p('./data')
    FileUtils.touch('./data/books.json') if !File.exist?('./data/books.json') && filename == 'books'
    FileUtils.touch('./data/people.json') if !File.exist?('./data/people.json') && filename == 'people'
    FileUtils.touch('./data/rentals.json') if !File.exist?('./data/rentals.json') && filename == 'rentals'
  end

  def save_books(books)
    books_array = []
    books.each do |book|
      books_array << { title: book.title, author: book.author }
    end
    return if books_array.empty?

    check_file_exist('books')
    File.write('./data/books.json', JSON.pretty_generate(books_array))
  end

  def save_people(people)
    people_array = []
    people.each do |person|
      person_obj = {

        name: person.name,
        age: person.age,
        type: person.class.name
      }
      if person.instance_of?(::Teacher)
        person_obj[:specialization] = person.specialization
      else
        person_obj[:has_permission] = person.parent_permission
      end
      people_array << person_obj
    end
    return if people_array.empty?

    check_file_exist('people')
    File.write('./data/people.json', JSON.pretty_generate(people_array))
  end

  def save_rentals(rentals, books, people)
    rentals_array = []
    rentals.each do |rental|
      rental_obj = {
        date: rental.date,
        people_index: people.index(rental.person),
        book_index: books.index(rental.book)
      }

      rentals_array << rental_obj
    end
    return if rentals_array.empty?

    check_file_exist('rentals')
    File.write('./data/rentals.json', JSON.pretty_generate(rentals_array))
  end
end
