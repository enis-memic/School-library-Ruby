require 'json'

class ReadData
def read_books
    books = []
    return books unless File.exist?('./data/books.json')

    file = File.open('./data/books.json')
    data = JSON.parse(file.read)
    data.each do |book|
        books << Book.new(book['title'], book['author'])
    end
    file.close
    books

end

def read_rentals
    rentals = []
    return rentals unless File.exist?('./data/rentals.json')

    file = File.open('./data/rentals.json')
    data = JSON.parse(file.read)
    data.each do |rental|
        rentals << make_rental(rental)
    end
    file.close
    rentals
end

def make_rental(rental)
if rental['type'] == 'Student'
    student = Student.new(rental['classrom'], rental['age'], name: rental['name'], parent_persmission: rental['has_permission'])
    student.id = rental['id']
    book = Book.new(rental['title'], rental['author'])
    rental = Rental.new(rental['date'], student, book)
else
    teacher = Teacher.new(rental['specialization'], rental['age'], name: rental['name'])
    teacher.id = rental['id']
    book = Book.new(rental['title'], rental['author'])
    rental = Rental.new(rental['date'], teacher, book)
end
rental
end

end