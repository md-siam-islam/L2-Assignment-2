# What is PostgreSQL?
PostgreSQL is a powerful, open-source relational database system.
It helps you store, organize, and manage your data efficiently.

# What is the purpose of a database schema in PostgreSQL?
A schema is like a folder inside a database.It helps group tables, views, and other objects, so things stay organized and don’t get mixed up.

# Explain the Primary Key and Foreign Key concepts in PostgreSQL.
A Primary Key uniquely identifies each row in a table .A Foreign Key connects one table to another by linking to the primary key of that table and It helps build relationships between tables.

# What is the difference between the VARCHAR and CHAR data types?

VARCHAR(n): stores text up to n characters. It only uses space as needed. (Flexible)

CHAR(n): always uses exactly n characters. (Fixed length)
Use VARCHAR when the text length varies, CHAR for fixed-size codes.

# Explain the GROUP BY clause and its role in aggregation operations.

GROUP BY groups rows with the same values in one or more columns.
It is used with aggregate functions like COUNT(), SUM(), etc.