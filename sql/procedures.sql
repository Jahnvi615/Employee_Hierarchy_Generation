CREATE PROCEDURE SP_hierarchy
AS
BEGIN
    -- Step 1: Truncate the Employee_Hierarchy table
    TRUNCATE TABLE Employee_Hierarchy;

    -- Step 2: Recursive CTE to generate hierarchy with levels
    WITH EmployeeCTE AS (
        SELECT 
            e.EmployeeID,
            e.ReportingTo,
            e.EmailID,
            0 AS Level
        FROM 
            EMPLOYEE_MASTER e
        WHERE 
            e.ReportingTo IS NULL
        
        UNION ALL
        
        SELECT 
            e.EmployeeID,
            e.ReportingTo,
            e.EmailID,
            Level + 1
        FROM 
            EMPLOYEE_MASTER e
        INNER JOIN 
            EmployeeCTE cte ON e.ReportingTo = cte.EmployeeID
    )
    -- Step 3: Insert data into Employee_Hierarchy
    INSERT INTO Employee_Hierarchy (EMPLOYEEID, REPORTINGTO, EMAILID, LEVEL, FIRSTNAME, LASTNAME)
    SELECT 
        EmployeeID,
        ReportingTo,
        EmailID,
        Level,
        dbo.FIRST_NAME(EmailID) AS FIRSTNAME,
        dbo.LAST_NAME(EmailID) AS LASTNAME
    FROM 
        EmployeeCTE;
END
GO
