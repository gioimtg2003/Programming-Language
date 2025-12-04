pub struct Book {
    pub title: String,
    pub author: String,

    is_available: bool,
}

impl Book {
    pub fn new(title: String, author: String) -> Self {
        Book{
            title,
            author,
            is_available : true
        }
    }

    pub fn is_available(&self) -> bool {
        self.is_available
    }

    pub fn set_borrowed(&mut self) {
        if self.is_available {
            self.is_available = false;
            println!("Book has been borrowed");
        }else {
            self.is_available = true;
            println!("Book is already borrowed");
        }
    }

    pub fn info(&self) {
        println!("Book: {}", self.title);
        println!("Author: {}", self.author);
    }
}