# Chapter 7 — Managing Growing Projects with Packages, Crates, and Modules

## Overview

As your Rust projects grow, organizing code becomes increasingly important. By grouping related functionality and separating code with distinct features, it becomes clearer where to find code for a given feature and where to make changes. A single file/module works fine for small programs, but larger projects benefit from splitting code into modules, files, crates, and packages. :contentReference[oaicite:1]{index=1}

Rust’s module system (packages, crates, modules, paths) gives you tools to manage visibility (public vs private), scope (which names are in scope), and project organization. :contentReference[oaicite:2]{index=2}

Below is a breakdown of the 5 sub-sections.

---

## 7.1. Packages and Crates

-   **Package**: Một feature của Cargo — là đơn vị bạn thường check-in vào version control (ví dụ: git). Package được định nghĩa bởi một file `Cargo.toml` ở thư mục gốc. :contentReference[oaicite:4]{index=4}
-   **Crate**: Là "unit of compilation" cho Rust. Một crate có thể là thư viện (library crate) hoặc chương trình thực thi (binary crate). :contentReference[oaicite:5]{index=5}
-   **Crate root**: Nếu package có `src/main.rs` → binary crate; nếu có `src/lib.rs` → library crate; Nếu có cả hai → package chứa cả library crate và binary crate. :contentReference[oaicite:6]{index=6}
-   Một package có thể chứa **nhiều binary crates** và tùy chọn **một library crate**. Khi dự án lớn hơn, bạn có thể **tách các phần** ra thành crates riêng biệt — có thể trở thành dependencies bên ngoài. :contentReference[oaicite:7]{index=7}

---

## 7.2. Defining Modules to Control Scope and Privacy

-   **Module (mod)**: Cách để nhóm các phần code liên quan nhau (functions, structs, enums, sub-modules, v.v.) bên trong một crate, nhằm tổ chức code rõ ràng hơn. :contentReference[oaicite:8]{index=8}
-   Module giúp bạn kiểm soát **scope** (những tên nào đang “in scope” tại vị trí đó) và **privacy** (những phần nào public, phần nào private). :contentReference[oaicite:9]{index=9}
-   Mặc định, items (functions, structs ...) trong module là private với bên ngoài; để cho phép sử dụng bên ngoài, bạn cần khai báo với từ khóa `pub`. :contentReference[oaicite:10]{index=10}
-   Module có thể lồng nhau (sub-modules), giúp phân cấp rõ ràng theo chức năng hoặc domain. Ví dụ: một module `front_of_house` có thể chứa sub-modules `hosting`, `serving`, mỗi cái chứa hàm riêng. :contentReference[oaicite:11]{index=11}

---

## 7.3. Paths for Referring to an Item in the Module Tree

-   **Paths**: là cách để đặt tên và truy cập các items (struct, function, module, enum, v.v.) từ module khác hoặc crate khác. :contentReference[oaicite:12]{index=12}
-   Một path xác định rõ vị trí của item trong cây module. Ví dụ: `crate_name::module1::Submodule::function_name`. :contentReference[oaicite:13]{index=13}
-   Paths rất quan trọng để giữ cho code rõ ràng, dễ hiểu — đặc biệt khi cấu trúc module phức tạp, nhiều cấp. :contentReference[oaicite:14]{index=14}

---

## 7.4. Bringing Paths Into Scope with the `use` Keyword

-   Từ khóa `use` cho phép bạn **“import”** một path vào scope hiện tại — giúp bạn **viết code ngắn gọn hơn**, không cần mỗi lần đều gõ full path. :contentReference[oaicite:15]{index=15}
-   Ví dụ bạn có thể dùng:

    ```rust
    use crate::front_of_house::hosting;
    use module1::{func1, func2};
    use module2 as m2;
    ```
