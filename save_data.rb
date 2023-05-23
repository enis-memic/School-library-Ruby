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


end