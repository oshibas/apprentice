
```md
+-------------+           +---------------+           +------------------+
|   product   |           |   customer    |           |    purchase      |
+-------------+           +---------------+           +------------------+
| id (PK)     |           | id (PK)       |           | id (PK)          |
| name        |           | name          |           | customer_id (FK) |
| price       |           | age           |           +------------------+
| image       |           | job           |
+-------------+           | zip           |
                          | address       |
                          | email         |
                          | login         |
                          | password      |
                          +---------------+
                                 |
                                 |
                            +-------------------+
                            |  purchase_detail  |
                            +-------------------+
                            | purchase_id (FK)  |
                            | product_id (FK)   |
                            | count             |
                            +-------------------+
                                 |
                                 |
                            +-------------------+
                            |     favorite      |
                            +-------------------+
                            | customer_id (FK)  |
                            | product_id (FK)   |
                            +-------------------+
```
