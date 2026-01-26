void main() {
  Book b1 = Book("Data Structure", "Salah", "Programming", 210, 3, 4.5, false);
  Book b2 = Book("Flutter Book", "Sara", "Technology", 370, 2, 4.8, false);
  Book b3 = Book("Clean Code", "Ahmed", "Software", 420, 0, 4.9, false);

  b1.printBook();
  b1.borrow();
  b1.printBook();
  b1.returnBook();
  b1.printBook();

  b2.borrow();
  b2.borrow();

  b3.borrow();
}

class Book {
  String title;
  String author;
  String genre;
  int pages;
  int availableCopies;
  double rating;
  bool onLoan;

  Book(
    this.title,
    this.author,
    this.genre,
    this.pages,
    this.availableCopies,
    this.rating,
    this.onLoan,
  );

  void borrow() {
    if (availableCopies > 0 && onLoan == false) {
      availableCopies--;
      onLoan = true;
      print("Done the book is borrow successfully");
    } else {
      print("No Books is available Now");
    }
  }

  void returnBook() {
    availableCopies++;
    onLoan = false;
    print(" Done the book is return successfull");
  }

  void printBook() {
    print("$title");
    print("$author");
    print("$genre");
    print("$pages");
    print("$availableCopies");
    print("$rating");
    print("$onLoan");
    print("==============================");
  }
}
