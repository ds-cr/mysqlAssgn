## Q1

- Used `CREATE TABLE` for creating `employees` table.
- For building the result used `SUM` with subquery `Gender = *required_gender*`.
- Used `GROUP BY` for dividing the result into different departments.

## Q2

- Used `CREATE TABLE` for creating `employee_salaries` table.
- First created a temporary table named `data` that looks like the required result using `WITH` clause.
- Then to get the required rows from `data` used `WHERE` clause to match salaries generated from a subquery.
- The subquery returns maximum salaries for each employee from `data` using `MAX`.

## Q3

- Used `CREATE TABLE` for creating `test_results` table.
- Used `GROUP_CONCAT` to combine rows with same marks.
- To give rank used `ROW_NUMBER`. Basically `ROW_NUMBER` will use `ORDER BY` to order the rows according to marks, and the after the grouping and sorting the row number simply represents the rank.

## Q4

- Created `candidates` and inserted values into that.
- Then created a temporary copy of the `candidates` using `WITH` clause.
- Then deleted rows from the current table using `WHERE` clause and a subquery.
- The subquery returns the minimum ids for each email. Using `NOT IN` clause deleted those rows whose id was not in the subquery's returned ids.
