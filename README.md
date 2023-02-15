# Mysql Assgn

## Question 1
- Created `SCHEMA q1` and `TABLE employees`. Inserted values into the table.
- My approach to the problem is a full join of two tables, one containing count of male employees in each department and other containing count of female employees in each department.
- Count of male employees is formed using `COUNT` of Gender, with `WHERE` limiting Gender to Male and `GROUP BY` to divide the result into different departments.
- Similarly count of female employees is generated.
- Since *MySQL does not have full join*, I mocked it using `union of left and right join` of the two tables. 
- So query looks like this
  ```
  SELECT ...
  FROM
  {table of count of male employees ...}
  LEFT JOIN
  {table of count of female employees ...}

  UNION

  {table of count of male employees ...}
  RIGHT JOIN
  {table of count of female employees ...}
  ```

### Pic
<img src = "https://github.com/ds-cr/mysqlAssgn/blob/master/photos/q1.png" alt = "Question 1 image" width = 300>

*****

## Question 2
- Created `SCHEMA q2` and `TABLE employees`. Inserted values into the table.
- My approach to the problem is first creating a table that looks like the result i.e. a table containing `Name`, `Month` & `Salary`. Then filter out data using the conditions.
- To create the table similar to result I used `UNION` to combine three tables (corressponding to each month). 

  Example table for January looks like this.
  
  Query - ```SELECT `Name`, Jan AS `Value`, "Jan" AS `Month` FROM employees```

  | Name  | Value | Month |
  | ----- | ----- | ----- |
  | W | 3244.00 | Jan |
  | X | 5200.00 | Jan |
  | .. | .. | .. |
  
- Then for filtering I used a `WHERE` matching `name` and `salary` from a table containing the name and maximum salary (using `GREATEST`) of each employee.
- Finaly query looks like this
  ```
  SELECT ..
  FROM {union or required table}
  WHERE EXISTS
  (
  SELECT '' FROM .. 
  WHERE required_table.`Name` = emp.`Name` AND required_table.`Value` = GREATEST(emp.Jan, emp.Feb, emp.March)
  )
  ```

### Pic
<img src = "https://github.com/ds-cr/mysqlAssgn/blob/master/photos/q2.png" alt = "Question 1 image" width = 200>

*****

## Question 3
- Created `SCHEMA q3` and `TABLE employees`. Inserted values into the table.
- For combining ids with comma I used `GROUP_CONCAT` to join rows with same value.
- For ranks I use the row number after the concatenation. For row number, I have created a `user variable @rn` which is initially zero. The `Scores, (SELECT @rk:=0)` statement basically assigns a new column to Scores table with all rows assigned to zero.
- The outer select statement just increments the variable for each row.

### Pic
<img src = "https://github.com/ds-cr/mysqlAssgn/blob/master/photos/q3.png" alt = "Question 1 image" width = 200>

*****

## Question 4
- Created `SCHEMA q4` and `TABLE employees`. Inserted values into the table.
- For deleting I used a subquery to select the the minimum id for each email.
- Then I used `NOT IN` for selecting and deleting rows with larger IDs. Since we cannot use the table from which we are deleting in the WHERE clause in MySQL, I `nested SELECT` to bypass this situation.

### Pic
<img src = "https://github.com/ds-cr/mysqlAssgn/blob/master/photos/q4.png" alt = "Question 1 image" width = 200>
