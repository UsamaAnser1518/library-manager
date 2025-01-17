# db/seeds.rb

# Create LibraryAdmin

admin_attributes = {
  name : 'admin',
  username : 'library_admin',
  email : 'admin@library.com',
  password : '123456',
  password_confirmation : "123456" 
}
 
LibraryAdmin.find_or_create_by(admin_attributes)

# Create Libraries
libraries = [
  { name: 'Central Library' },
  { name: 'Downtown Branch' }
]

libraries.each do |library_attrs|
  Library.find_or_create_by(library_attrs)
end

# Get libraries for associating with books
central_library = Library.find_by(name: 'Central Library')
downtown_branch = Library.find_by(name: 'Downtown Branch')

# Create Books
books = [
  { title: 'To Kill a Mockingbird', isbn: '9780061120084', author: 'Harper Lee', library: central_library },
  { title: '1984', isbn: '9780451524935', author: 'George Orwell', library: central_library },
  { title: 'The Great Gatsby', isbn: '9780743273565', author: 'F. Scott Fitzgerald', library: downtown_branch },
  { title: 'Moby Dick', isbn: '9781503280786', author: 'Herman Melville', library: downtown_branch }
]

books.each do |book_attrs|
  Book.find_or_create_by(book_attrs)
end

# Create Borrowers
borrowers = [
  { name: 'Alice Smith', card_csv: '111', card_number: '1234567890', card_title: 'Ms.' },
  { name: 'Bob Johnson', card_csv: '222', card_number: '0987654321', card_title: 'Mr.' }
]

borrowers.each do |borrower_attrs|
  Borrower.find_or_create_by(borrower_attrs)
end

puts 'Seed data created successfully!'
