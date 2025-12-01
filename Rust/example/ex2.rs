struct Account {
    username: String,
    email: Option<String>,
    password: String,
    is_verified: bool,
}

impl Account {
    fn info(&self) {
        if self.is_verified {
            println!("You are verified");
        }

        println!("{}", self.username);
        match self.email {
            Some(ref email) => println!("{} verified", email),
            None => println!("No email address"),
        }
    }
}

fn main() {

    let account = Account{
        is_verified: true,
        username: String::from("Gioi Nguyen"),
        password: String::from("passsword"),
        email: None,
    };

    account.info();
}