EXO1

 
    CREATE TABLE Emp1 (
    Idemp INT,
    NomEmp VARCHAR(100),
    sal float,
    deptno INT
);

    CREATE TABLE Emp2 (
    Idemp INT,
    NomEmp VARCHAR(100),
    sal float,
    deptno INT
);

 
    DELIMITER //
    CREATE PROCEDURE InsertEmployeesBySalary()
    BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE empId INT;
    DECLARE empName VARCHAR(100);
    DECLARE empSal float;
    DECLARE empDept INT;
    
    
    DECLARE cur CURSOR FOR SELECT Idemp, NomEmp, sal, deptno FROM Emp;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    
    OPEN cur;
    
     
    read_loop: LOOP
        FETCH cur INTO empId, empName, empSal, empDept;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        
        IF empSal > 3000 THEN
            INSERT INTO Emp1 VALUES (empId, empName, empSal, empDept);
        ELSE
            INSERT INTO Emp2 VALUES (empId, empName, empSal, empDept);
        END IF;
        END LOOP;
    
    
        CLOSE cur;

     
    SELECT COUNT(*) FROM Emp;
    END //
 


EXO2 ***********

--a
CREATE TABLE Archive AS
SELECT Id, Nom, Service, Salaire
FROM Emp
WHERE Service = 'Vendeur';



--b
CREATE TABLE Archive1 AS
SELECT Id, Nom, Service, Salaire
FROM Emp
WHERE Service = 'Vendeur'
ORDER BY Salaire DESC
LIMIT N;
