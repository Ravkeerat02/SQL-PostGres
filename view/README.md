## View 
Result set of data in the form of table - in simple words makes it easy to understand complex data problems

```sql
CREATE VIEW EmployeeDetails AS
SELECT employees.employee_id, employees.employee_name, employees.salary, departments.department_name
FROM employees
JOIN departments ON employees.department_id = departments.department_id;
SELECT * FROM EmployeeDetails;
```
