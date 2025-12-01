use std::io;
struct Student {
    name: String,
    age: i32,
    class_name: String,
    rank: String
}

fn get_info(student: &Student) {
    println!("name::: {} age::: {} class name::: {} rank::: {}", student.name, student.age, student.class_name, student.rank);

}

fn create_student(name: String, age: i32, class_name: String, rank: String) -> Student{
    Student{name, age, class_name, rank}
}

fn main() {

    println!("Starting create student...");

    let mut name = String::new();
    let mut age = String::new();
    let mut class_name = String::new();
    let mut rank = String::new();

    println!("Please Enter your name:");
    io::stdin().read_line(&mut name).ok().expect("Failed to read name");

    println!("Enter your age:");
    io::stdin().read_line(&mut age).ok().expect("Failed to read age");

    println!("Enter your class_name:");
    io::stdin().read_line(&mut class_name).ok().expect("Failed to read class_name");

    println!("Enter your rank:");
    io::stdin().read_line(&mut rank).ok().expect("Failed to read rank");


    let student:Student = create_student(name, age.trim().parse().unwrap(), class_name, rank);

    get_info(&student);


}