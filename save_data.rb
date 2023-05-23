require 'json'
require 'fileutils'

class SaveData
def check_file_exist(filename)
    FileUtils.mkdir_p('./data')
    FileUtils.touch('./data/books.json') if !File.exist?('./data/books,json') && filename == 'books'
end
def save_books(books)
books_array = []
books.each do |book|
    books_array << {title: book.title, author: book.author}
end
return if books_array.empty?
check_file_exist('books')
File.write('./data/books.json', JSON.pretty_generate(books_array))
end

def save_rentals(rentals)
    rentals_array = []
    rentals.each do |rental|
        rental_obj = {
            date:rental.date, 
            title: rental.book.title,
            author: rental.book.author,
            name: rental.person.name,
            age: rental.person.age,
            has_permission: rental.person.parent_permission,
            type: rental.person.type
        }
        if rental.person.type == 'Studnet'
            rental_obj[:classrom] = rental.person.classroom
        else 
            rental_obj[:specialization] = rental.person.specialization
        end
        rentals_array << rental_obj
    end
    return if rentals_array.empty?
    check_file_exist('rentals')
    File.write('./data/rentals.json', JSON.pretty_generate(rentals_array))
end


end