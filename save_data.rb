require 'json'
require 'fileutils'

class SaveData
def self.create_file(path, array)
    FileUtils.mkdir_p('./data')
    FileUtils.touch(path) unless File.exist?(path)
    File.write(path, JSON.pretty_generate(array))
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