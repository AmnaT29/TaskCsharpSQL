SELECT FirstName + ' ' + LastName
 FROM Person.Person;
 
 SELECT JobTitle
 FROM HumanResources.Employee
 GROUP BY OrganizationLevel;

 SELECT Name
 FROM HumanResources.Department
 GROUP BY DepartmentID;;

 SELECT Rate
 FROM HumanResources.EmployeePayHistory;

 SELECT Name
 FROM HumanResources.Shift;