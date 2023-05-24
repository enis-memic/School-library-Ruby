require_relative 'spec_helper'

describe Book do
  before :each do
    @book = Book.new('Adventure of Tom Sawyer', 'Mark Twain')
  end

  it 'Should have title' do
    title = @book.title
    expect(title).to eq 'Adventure of Tom Sawyer'
  end

  it 'Should have author' do
    author = @book.author
    expect(author).to eq 'Mark Twain'
  end
end