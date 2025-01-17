# Library Management System

## Introduction
This Ruby on Rails application manages a library system, providing functionality for managing books, borrowers, and libraries. It includes features like adding and searching books, lending and returning books, and managing borrowers and library details.

## Models
### LibraryAdmin
- **Attributes**: `email`, `name`, `password_digest`, `username`, `created_at`, `updated_at`.
- **Functionality**: A single main admin user for handling all library operations.

### Book
- **Attributes**: `title`, `isbn`, `author`, `copies`, `is_availble`, `library_id`, `created_at`, `updated_at`.
- **Associations**: Belongs to a `Library`. Has many `BorrowerBooks` and `Borrowers` through `BorrowerBooks`.
- **Functionality**: Search (global and by title), check availability.

### Borrower
- **Attributes**: `name`, `card_csv`, `card_number`, `card_title`, `created_at`, `updated_at`.
- **Associations**: Has many `BorrowerBooks`, `Books` through `BorrowerBooks`, and `Libraries` through `LibraryBorrowers`.
- **Functionality**: Track borrowed books with due dates.

### Library
- **Attributes**: `name`, `created_at`, `updated_at`.
- **Associations**: Has many `Books` and `Borrowers` through `LibraryBorrowers`.
- **Validations**: Name presence and uniqueness, length constraint.

### LibraryBorrower
- **Associations**: Belongs to `Library` and `Borrower`.

### BorrowerBook
- **Attributes**: `due_date`, `created_at`, `updated_at`, `book_id`, `borrower_id`.
- **Associations**: Belongs to `Book` and `Borrower`.

## Controllers
### LibraryAdminsController
- **Endpoints**: `index`, `show`, `create`, `update`, `destroy`.
- **Functionality**: Handle all the library operations as a single main entity.

### BooksController
- **Endpoints**: `index`, `create`, `search`.
- **Functionality**: List, add, and search for books within a library.

### BorrowersController
- **Endpoints**: `index`, `create`, `lend_book`, `return_book`.
- **Functionality**: Manage borrowers, lend and return books.

### LibrariesController
- **Endpoints**: `index`, `create`.
- **Functionality**: List and create libraries.

## Setup Instructions
1. Clone the repository.
2. Run `bundle install` to install dependencies.
3. Setup your database with `rails db:setup`.
4. Start the server with `rails s`.

## Usage
1. **Adding a LibraryAdmin**: POST to `/library_admins` with `name`, `username`, `email`, `password`, and `password_confirmation`.
2. **Login with LibraryAdmin**: POST to `/auth/login` with `email`, `password`,
3. **Adding a Library**: POST to `/libraries` with `name`.
4. **Adding a Book**: POST to `/libraries/:library_id/books` with `title`, `isbn`, and `author`.
5. **Searching Books**: GET to `/libraries/:library_id/books/search` with search parameters.
6. **Adding a Borrower**: POST to `/libraries/:library_id/borrowers` with borrower details.
7. **Lending a Book**: POST to `/libraries/:library_id/borrowers/:id/lend_book`.
8. **Returning a Book**: POST to `/libraries/:library_id/borrowers/:id/return_book`.
9. **Note**: Don't forget to add auth token in requests.

## Features
- **Auth with JWT**
- **Create Library**
- **Add Book to Library**
- **Global Search**
- **Model Wide Search**
- **Register Borrower**
- **Lend Books**
- **Return Books**

## Testing
- Run tests using `rspec`.