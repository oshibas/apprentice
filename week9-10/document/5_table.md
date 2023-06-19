## Table: product

| Column | Type         | Constraints |
| ------ | ------------ | ----------- |
| id     | int          | PRIMARY KEY |
| name   | varchar(200) | NOT NULL    |
| price  | int          | NOT NULL    |
| image  | varchar(200) | NOT NULL    |

## Table: login

| Column   | Type         | Constraints      |
| -------- | ------------ | ---------------- |
| id       | int          | PRIMARY KEY      |
| username | varchar(100) | NOT NULL, UNIQUE |
| password | varchar(100) | NOT NULL         |

## Table: password_reset

| Column                                      | Type         | Constraints |
| ------------------------------------------- | ------------ | ----------- |
| id                                          | int          | PRIMARY KEY |
| login_id                                    | int          | NOT NULL    |
| token                                       | varchar(100) | NOT NULL    |
| FOREIGN KEY (login_id) REFERENCES login(id) |

## Table: favorite

| Column                                          | Type | Constraints |
| ----------------------------------------------- | ---- | ----------- |
| customer_id                                     | int  | NOT NULL    |
| product_id                                      | int  | NOT NULL    |
| PRIMARY KEY (customer_id, product_id)           |
| FOREIGN KEY (customer_id) REFERENCES login(id)  |
| FOREIGN KEY (product_id) REFERENCES product(id) |
