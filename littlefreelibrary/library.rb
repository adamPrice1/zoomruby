require 'yaml'

class Library
  def initialize
    @books = YAML.load(File.read("library_books.yml"))
    puts @books
  end

  def add_book(book_obj)
    if self.book_count < 18
      @books.push(book_obj)
      return true
    end
    false
  end

  def book_count
    @books.length
  end

  def look
    @books
  end

  def take(book)
    if @books.include?(book)
      puts "removing #{book['Title']}"
      @books.delete(book)
      return true
    end
    false
  end

  def close

  end
end





library = Library.new
# library.add_book({"King James Bible": {
#   "Title" => "King James Bible",
#   "Page_count" => 12345
#   }})
# puts library.book_count

input = ""
puts "Hi! Welcome to the little library. \nEnter 1 to see what books are available \nEnter 2 to take a book \nEnter 3 to see your current books \nEnter 4 to replace a book \n\nType \"exit\" to save your books and exit"
instructions = "\nEnter 1 to see what books are available \nEnter 2 to take a book \nEnter 3 to see your current books \nEnter 4 to replace a book \n\nType \"exit\" to save your books and exit"
user_books = []

while input != "exit"

  input = gets.chomp

  if input == "1"
    library.look.each {|book| puts book["Title"]}
    puts instructions

  elsif input == "2"
    puts "Choose a book to take:"
    library.look.each_with_index do |book, i|
      puts "#{i+1}. #{book["Title"]}"
    end
    input = gets.chomp
    if input.to_i.to_s != input
      puts "Sorry, invalid input"
      puts instuctions
      next
    end
    book = library.look[input.to_i - 1]
    if library.take(library.look[input.to_i - 1])
      user_books.push(book)
      puts "great! enjoy #{book["Title"]}"
      puts instructions
    else
      puts "I'm afraid that's not a book in the library"
      puts instructions
    end

  elsif input == "3"
    user_books.each {|book| puts book["Title"]}
    puts instructions

  elsif input == "4"
    puts "choose a book to replace:"
    user_books.each_with_index do |book, i|
      puts "#{i+1}. #{book["Title"]}"
    end
    input = gets.chomp
    if input.to_i.to_s != input
      puts "Sorry, invalid input"
      puts instuctions
      next
    end


    book = user_books[input.to_i - 1]
    if !book
      puts "Sorry, invalid input"
      puts instructions
      next
    end
    if library.add_book(book)
      user_books.delete(book)
      puts "great! hope you enjoyed #{book["Title"]}"
      puts instructions
    else
      puts "I'm afraid that's not a book you have"
      puts instructions
    end
  end
end

File.open("library_books.yml","w") {|file| file.write(library.look.to_yaml)}
