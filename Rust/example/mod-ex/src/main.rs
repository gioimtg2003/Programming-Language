mod models;
use models::Book;
fn main() {
    let mut book = Book::new("Test".to_string(), "Nguyen Cong Gioi".to_string());

    book.info();
    book.set_borrowed();
}