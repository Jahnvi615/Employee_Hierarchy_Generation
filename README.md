# Employee Hierarchy Project

This project generates an employee hierarchy based on data stored in the `EMPLOYEE_MASTER` table and stores the output in the `Employee_Hierarchy` table.

## Files

- `sql/functions.sql`: Contains SQL functions to extract first and last names from email addresses.
- `sql/tables.sql`: Contains the SQL script to create the `Employee_Hierarchy` table.
- `sql/procedures.sql`: Contains the stored procedure to generate the employee hierarchy.
- `sql/data.sql`: Contains the sample data for the `EMPLOYEE_MASTER` table.

## Setup

1. Ensure you have a SQL Server instance running.
2. Run the scripts in the following order:
    1. `sql/functions.sql`
    2. `sql/tables.sql`
    3. `sql/data.sql`
    3. `sql/procedures.sql`

## Usage

1. Execute the stored procedure `SP_hierarchy` to generate and populate the employee hierarchy.
