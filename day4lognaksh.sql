MariaDB [(none)]> USE CSD2204S18
Database changed
MariaDB [CSD2204S18]> SHOW TABLES;
+----------------------+
| Tables_in_csd2204s18 |
+----------------------+
| customer             |
+----------------------+
1 row in set (0.02 sec)

MariaDB [CSD2204S18]> SELECT *FROM Customer;
Empty set (0.05 sec)

MariaDB [CSD2204S18]> DESC Customer;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custid     | varchar(5)  | NO   | PRI | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.08 sec)

MariaDB [CSD2204S18]> INSERT INTO Customer VALUES('C01','ashley','ash','WDC','321200',34);
Query OK, 1 row affected (0.14 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer;
+--------+--------+----------+------+------------+------+
| custid | name   | nickname | city | postalCode | age  |
+--------+--------+----------+------+------------+------+
| C01    | ashley | ash      | WDC  | 321200     |   34 |
+--------+--------+----------+------+------------+------+
1 row in set (0.02 sec)

MariaDB [CSD2204S18]> INSERT INTO Customer VALUES('C02','Bob marley','bm','Toronto','100100',23);
Query OK, 1 row affected (0.05 sec)

MariaDB [CSD2204S18]> INSERT INTO Customer VALUES('C03','cherlies theron','cher','New york','120134',20);
Query OK, 1 row affected (0.01 sec)

MariaDB [CSD2204S18]> INSERT INTO Customer VALUES('C04','Denial jack','DJ','brazil','341020',25);
Query OK, 1 row affected (0.02 sec)

MariaDB [CSD2204S18]> INSERT INTO Customer VALUES('C05','Donna newman','new','toronto','130120',50);
Query OK, 1 row affected (0.05 sec)

MariaDB [CSD2204S18]> INSERT INTO Customer VALUES('C06','eston M.','M.','toronto','201023',65);
Query OK, 1 row affected (0.02 sec)

MariaDB [CSD2204S18]> INSERT INTO Customer VALUES('C07','Bobby Chacko','chac','new york','320300',70);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204S18]> INSERT INTO Customer VALUES('C08','Ashko Charles','AK','USA','421044',72);
Query OK, 1 row affected (0.02 sec)

MariaDB [CSD2204S18]> INSERT INTO Customer VALUES('C09','Tony special','Specie','GTA','418921',62);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204S18]> INSERT INTO Customer VALUES('C10','Jack sp','Sparrow','New jersy','102301',58);
Query OK, 1 row affected (0.01 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer;
+--------+-----------------+----------+-----------+------------+------+
| custid | name            | nickname | city      | postalCode | age  |
+--------+-----------------+----------+-----------+------------+------+
| C01    | ashley          | ash      | WDC       | 321200     |   34 |
| C02    | Bob marley      | bm       | Toronto   | 100100     |   23 |
| C03    | cherlies theron | cher     | New york  | 120134     |   20 |
| C04    | Denial jack     | DJ       | brazil    | 341020     |   25 |
| C05    | Donna newman    | new      | toronto   | 130120     |   50 |
| C06    | eston M.        | M.       | toronto   | 201023     |   65 |
| C07    | Bobby Chacko    | chac     | new york  | 320300     |   70 |
| C08    | Ashko Charles   | AK       | USA       | 421044     |   72 |
| C09    | Tony special    | Specie   | GTA       | 418921     |   62 |
| C10    | Jack sp         | Sparrow  | New jersy | 102301     |   58 |
+--------+-----------------+----------+-----------+------------+------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT name,nickname FROM Customer;
+-----------------+----------+
| name            | nickname |
+-----------------+----------+
| ashley          | ash      |
| Bob marley      | bm       |
| cherlies theron | cher     |
| Denial jack     | DJ       |
| Donna newman    | new      |
| eston M.        | M.       |
| Bobby Chacko    | chac     |
| Ashko Charles   | AK       |
| Tony special    | Specie   |
| Jack sp         | Sparrow  |
+-----------------+----------+
10 rows in set (0.02 sec)

MariaDB [CSD2204S18]> SELECT city,postalCode FROM Customer;
+-----------+------------+
| city      | postalCode |
+-----------+------------+
| WDC       | 321200     |
| Toronto   | 100100     |
| New york  | 120134     |
| brazil    | 341020     |
| toronto   | 130120     |
| toronto   | 201023     |
| new york  | 320300     |
| USA       | 421044     |
| GTA       | 418921     |
| New jersy | 102301     |
+-----------+------------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer WHERE name = 'ashley';
+--------+--------+----------+------+------------+------+
| custid | name   | nickname | city | postalCode | age  |
+--------+--------+----------+------+------------+------+
| C01    | ashley | ash      | WDC  | 321200     |   34 |
+--------+--------+----------+------+------------+------+
1 row in set (0.05 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer WHERE nickname = 'AK';
+--------+---------------+----------+------+------------+------+
| custid | name          | nickname | city | postalCode | age  |
+--------+---------------+----------+------+------------+------+
| C08    | Ashko Charles | AK       | USA  | 421044     |   72 |
+--------+---------------+----------+------+------------+------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer WHERE name = 'eston M.';
+--------+----------+----------+---------+------------+------+
| custid | name     | nickname | city    | postalCode | age  |
+--------+----------+----------+---------+------------+------+
| C06    | eston M. | M.       | toronto | 201023     |   65 |
+--------+----------+----------+---------+------------+------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer WHERE city != 'toronto';
+--------+-----------------+----------+-----------+------------+------+
| custid | name            | nickname | city      | postalCode | age  |
+--------+-----------------+----------+-----------+------------+------+
| C01    | ashley          | ash      | WDC       | 321200     |   34 |
| C03    | cherlies theron | cher     | New york  | 120134     |   20 |
| C04    | Denial jack     | DJ       | brazil    | 341020     |   25 |
| C07    | Bobby Chacko    | chac     | new york  | 320300     |   70 |
| C08    | Ashko Charles   | AK       | USA       | 421044     |   72 |
| C09    | Tony special    | Specie   | GTA       | 418921     |   62 |
| C10    | Jack sp         | Sparrow  | New jersy | 102301     |   58 |
+--------+-----------------+----------+-----------+------------+------+
7 rows in set (0.03 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer WHERE age < 50;
+--------+-----------------+----------+----------+------------+------+
| custid | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| C01    | ashley          | ash      | WDC      | 321200     |   34 |
| C02    | Bob marley      | bm       | Toronto  | 100100     |   23 |
| C03    | cherlies theron | cher     | New york | 120134     |   20 |
| C04    | Denial jack     | DJ       | brazil   | 341020     |   25 |
+--------+-----------------+----------+----------+------------+------+
4 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer WHERE name > 'ashley';
+--------+-----------------+----------+-----------+------------+------+
| custid | name            | nickname | city      | postalCode | age  |
+--------+-----------------+----------+-----------+------------+------+
| C02    | Bob marley      | bm       | Toronto   | 100100     |   23 |
| C03    | cherlies theron | cher     | New york  | 120134     |   20 |
| C04    | Denial jack     | DJ       | brazil    | 341020     |   25 |
| C05    | Donna newman    | new      | toronto   | 130120     |   50 |
| C06    | eston M.        | M.       | toronto   | 201023     |   65 |
| C07    | Bobby Chacko    | chac     | new york  | 320300     |   70 |
| C09    | Tony special    | Specie   | GTA       | 418921     |   62 |
| C10    | Jack sp         | Sparrow  | New jersy | 102301     |   58 |
+--------+-----------------+----------+-----------+------------+------+
8 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SLECT * FROM Customer WHERE name < 'donna';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'SLECT * FROM Customer WHERE name < 'donna'' at line 1
MariaDB [CSD2204S18]> SELECT * FROM Customer WHERE name < 'donna';
+--------+-----------------+----------+----------+------------+------+
| custid | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| C01    | ashley          | ash      | WDC      | 321200     |   34 |
| C02    | Bob marley      | bm       | Toronto  | 100100     |   23 |
| C03    | cherlies theron | cher     | New york | 120134     |   20 |
| C04    | Denial jack     | DJ       | brazil   | 341020     |   25 |
| C07    | Bobby Chacko    | chac     | new york | 320300     |   70 |
| C08    | Ashko Charles   | AK       | USA      | 421044     |   72 |
+--------+-----------------+----------+----------+------------+------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT name ,city FROM Customer WHERE name ='ashley' OR city = 'toronto';
+--------------+---------+
| name         | city    |
+--------------+---------+
| ashley       | WDC     |
| Bob marley   | Toronto |
| Donna newman | toronto |
| eston M.     | toronto |
+--------------+---------+
4 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT name,city FROM Customer WHERE city = 'New york' || 'Toronto';
+-----------------+----------+
| name            | city     |
+-----------------+----------+
| cherlies theron | New york |
| Bobby Chacko    | new york |
+-----------------+----------+
2 rows in set, 4 warnings (0.00 sec)

MariaDB [CSD2204S18]> SELECT name,city FROM Customer WHERE city = 'New york' || city = 'Toronto';
+-----------------+----------+
| name            | city     |
+-----------------+----------+
| Bob marley      | Toronto  |
| cherlies theron | New york |
| Donna newman    | toronto  |
| eston M.        | toronto  |
| Bobby Chacko    | new york |
+-----------------+----------+
5 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT name,age FROM Customer WHERE city = 'toronto' || age > 50;
+---------------+------+
| name          | age  |
+---------------+------+
| Bob marley    |   23 |
| Donna newman  |   50 |
| eston M.      |   65 |
| Bobby Chacko  |   70 |
| Ashko Charles |   72 |
| Tony special  |   62 |
| Jack sp       |   58 |
+---------------+------+
7 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT COUNT (*) FROM Customer WHERE city ='toronto';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '*) FROM Customer WHERE city ='toronto'' at line 1
MariaDB [CSD2204S18]> SELECT COUNT(*) FROM Customer WHERE city ='toronto';
+----------+
| COUNT(*) |
+----------+
|        3 |
+----------+
1 row in set (0.03 sec)

MariaDB [CSD2204S18]> SELECT COUNT(*)  "No of Customers in Toronto" FROM Customer WHERE city ='toronto';
+----------------------------+
| No of Customers in Toronto |
+----------------------------+
|                          3 |
+----------------------------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SECLECT CUNT(*) "No of Customers with age more than 50" FROM Customer WHERE age >50;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'SECLECT CUNT(*) "No of Customers with age more than 50" FROM Customer WHERE age ' at line 1
MariaDB [CSD2204S18]> SECLECT COUNT(*) "No of Customers with age more than 50" FROM Customer WHERE age >50;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'SECLECT COUNT(*) "No of Customers with age more than 50" FROM Customer WHERE age' at line 1
MariaDB [CSD2204S18]> SELECT COUNT(*) "No of Customers with age more than 50" FROM Customer WHERE age >50;
+---------------------------------------+
| No of Customers with age more than 50 |
+---------------------------------------+
|                                     5 |
+---------------------------------------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer WHERE age BETWEEN 30 AND 50;
+--------+--------------+----------+---------+------------+------+
| custid | name         | nickname | city    | postalCode | age  |
+--------+--------------+----------+---------+------------+------+
| C01    | ashley       | ash      | WDC     | 321200     |   34 |
| C05    | Donna newman | new      | toronto | 130120     |   50 |
+--------+--------------+----------+---------+------------+------+
2 rows in set (0.02 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer where NOT age BETWEEN 30 AND 50;
+--------+-----------------+----------+-----------+------------+------+
| custid | name            | nickname | city      | postalCode | age  |
+--------+-----------------+----------+-----------+------------+------+
| C02    | Bob marley      | bm       | Toronto   | 100100     |   23 |
| C03    | cherlies theron | cher     | New york  | 120134     |   20 |
| C04    | Denial jack     | DJ       | brazil    | 341020     |   25 |
| C06    | eston M.        | M.       | toronto   | 201023     |   65 |
| C07    | Bobby Chacko    | chac     | new york  | 320300     |   70 |
| C08    | Ashko Charles   | AK       | USA       | 421044     |   72 |
| C09    | Tony special    | Specie   | GTA       | 418921     |   62 |
| C10    | Jack sp         | Sparrow  | New jersy | 102301     |   58 |
+--------+-----------------+----------+-----------+------------+------+
8 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT max(age) FROM Customer;
+----------+
| max(age) |
+----------+
|       72 |
+----------+
1 row in set (0.05 sec)

MariaDB [CSD2204S18]> SELECT name, max(age) FROM Customer;
+--------+----------+
| name   | max(age) |
+--------+----------+
| ashley |       72 |
+--------+----------+
1 row in set (0.03 sec)

MariaDB [CSD2204S18]> SELECT min(age) FROM Customer;
+----------+
| min(age) |
+----------+
|       20 |
+----------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT avg(age) FROM Customer;
+----------+
| avg(age) |
+----------+
|  47.9000 |
+----------+
1 row in set (0.03 sec)

MariaDB [CSD2204S18]> SELEC * FROM customers WHERE name = 'b%';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'SELEC * FROM customers WHERE name = 'b%'' at line 1
MariaDB [CSD2204S18]> SELECT * FROM customers WHERE name = 'b%';
ERROR 1146 (42S02): Table 'csd2204s18.customers' doesn't exist
MariaDB [CSD2204S18]> SELECT * FROM Customer WHERE name = 'b%';
Empty set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * from Customer WHERE name LIKE '%n';
+--------+-----------------+----------+----------+------------+------+
| custid | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| C03    | cherlies theron | cher     | New york | 120134     |   20 |
| C05    | Donna newman    | new      | toronto  | 130120     |   50 |
+--------+-----------------+----------+----------+------------+------+
2 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * from Customer WHERE city LIKE 'N%';
+--------+-----------------+----------+-----------+------------+------+
| custid | name            | nickname | city      | postalCode | age  |
+--------+-----------------+----------+-----------+------------+------+
| C03    | cherlies theron | cher     | New york  | 120134     |   20 |
| C07    | Bobby Chacko    | chac     | new york  | 320300     |   70 |
| C10    | Jack sp         | Sparrow  | New jersy | 102301     |   58 |
+--------+-----------------+----------+-----------+------------+------+
3 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT 'Lust of Customer WHERE name LIKE '--n%';
    '> SELECT 'Listt of Customer WHERE name LIKE '--n%';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'of Customer WHERE name LIKE '--n%'' at line 1
MariaDB [CSD2204S18]> SELECT * FROM Cutomer WHERE name LIKE '__n%';
ERROR 1146 (42S02): Table 'csd2204s18.cutomer' doesn't exist
MariaDB [CSD2204S18]> SELECT * FROM Cutomer WHERE name LIKE '__n%';
ERROR 1146 (42S02): Table 'csd2204s18.cutomer' doesn't exist
MariaDB [CSD2204S18]> SELECT * FROM Customer LIMIT 2;
+--------+------------+----------+---------+------------+------+
| custid | name       | nickname | city    | postalCode | age  |
+--------+------------+----------+---------+------------+------+
| C01    | ashley     | ash      | WDC     | 321200     |   34 |
| C02    | Bob marley | bm       | Toronto | 100100     |   23 |
+--------+------------+----------+---------+------------+------+
2 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer WHERE age IN (20,25,30,40);
+--------+-----------------+----------+----------+------------+------+
| custid | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| C03    | cherlies theron | cher     | New york | 120134     |   20 |
| C04    | Denial jack     | DJ       | brazil   | 341020     |   25 |
+--------+-----------------+----------+----------+------------+------+
2 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer WHERE age NOT IN (20,25,30,40);
+--------+---------------+----------+-----------+------------+------+
| custid | name          | nickname | city      | postalCode | age  |
+--------+---------------+----------+-----------+------------+------+
| C01    | ashley        | ash      | WDC       | 321200     |   34 |
| C02    | Bob marley    | bm       | Toronto   | 100100     |   23 |
| C05    | Donna newman  | new      | toronto   | 130120     |   50 |
| C06    | eston M.      | M.       | toronto   | 201023     |   65 |
| C07    | Bobby Chacko  | chac     | new york  | 320300     |   70 |
| C08    | Ashko Charles | AK       | USA       | 421044     |   72 |
| C09    | Tony special  | Specie   | GTA       | 418921     |   62 |
| C10    | Jack sp       | Sparrow  | New jersy | 102301     |   58 |
+--------+---------------+----------+-----------+------------+------+
8 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer WHERE city IN ('Toronto','GTA','USA','WDC');
+--------+---------------+----------+---------+------------+------+
| custid | name          | nickname | city    | postalCode | age  |
+--------+---------------+----------+---------+------------+------+
| C01    | ashley        | ash      | WDC     | 321200     |   34 |
| C02    | Bob marley    | bm       | Toronto | 100100     |   23 |
| C05    | Donna newman  | new      | toronto | 130120     |   50 |
| C06    | eston M.      | M.       | toronto | 201023     |   65 |
| C08    | Ashko Charles | AK       | USA     | 421044     |   72 |
| C09    | Tony special  | Specie   | GTA     | 418921     |   62 |
+--------+---------------+----------+---------+------------+------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer WHERE CITY in ('G%','T%','N%');
Empty set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer LIKE '__n_a%';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'LIKE '__n_a%'' at line 1
MariaDB [CSD2204S18]> SELECT * FROM Customer WHERE name LIKE '__n_a%';
+--------+--------------+----------+---------+------------+------+
| custid | name         | nickname | city    | postalCode | age  |
+--------+--------------+----------+---------+------------+------+
| C04    | Denial jack  | DJ       | brazil  | 341020     |   25 |
| C05    | Donna newman | new      | toronto | 130120     |   50 |
+--------+--------------+----------+---------+------------+------+
2 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer WHERE name LIKE '__n%';
+--------+--------------+----------+---------+------------+------+
| custid | name         | nickname | city    | postalCode | age  |
+--------+--------------+----------+---------+------------+------+
| C04    | Denial jack  | DJ       | brazil  | 341020     |   25 |
| C05    | Donna newman | new      | toronto | 130120     |   50 |
| C09    | Tony special | Specie   | GTA     | 418921     |   62 |
+--------+--------------+----------+---------+------------+------+
3 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT 'List of unique cities';
+-----------------------+
| List of unique cities |
+-----------------------+
| List of unique cities |
+-----------------------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT DISTINCT(city) AS 'unique cities' FROM Customer;
+---------------+
| unique cities |
+---------------+
| WDC           |
| Toronto       |
| New york      |
| brazil        |
| USA           |
| GTA           |
| New jersy     |
+---------------+
7 rows in set (0.01 sec)

MariaDB [CSD2204S18]> SELECT COUNT (DISTINCT(city)) AS 'unique cities' FROM Customer;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'DISTINCT(city)) AS 'unique cities' FROM Customer' at line 1
MariaDB [CSD2204S18]> SELECT COUNT(DISTINCT(city)) AS 'unique cities' FROM Customer;
+---------------+
| unique cities |
+---------------+
|             7 |
+---------------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT 'List customers in increaing order of name ;
    '> ';
+----------------------------------------------+
| List customers in increaing order of name ;
 |
+----------------------------------------------+
| List customers in increaing order of name ;
 |
+----------------------------------------------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM  Customer ORDER BY name DESC;
+--------+-----------------+----------+-----------+------------+------+
| custid | name            | nickname | city      | postalCode | age  |
+--------+-----------------+----------+-----------+------------+------+
| C09    | Tony special    | Specie   | GTA       | 418921     |   62 |
| C10    | Jack sp         | Sparrow  | New jersy | 102301     |   58 |
| C06    | eston M.        | M.       | toronto   | 201023     |   65 |
| C05    | Donna newman    | new      | toronto   | 130120     |   50 |
| C04    | Denial jack     | DJ       | brazil    | 341020     |   25 |
| C03    | cherlies theron | cher     | New york  | 120134     |   20 |
| C07    | Bobby Chacko    | chac     | new york  | 320300     |   70 |
| C02    | Bob marley      | bm       | Toronto   | 100100     |   23 |
| C01    | ashley          | ash      | WDC       | 321200     |   34 |
| C08    | Ashko Charles   | AK       | USA       | 421044     |   72 |
+--------+-----------------+----------+-----------+------------+------+
10 rows in set (0.03 sec)

MariaDB [CSD2204S18]> SELECT * FROM  Customer ORDER BY age DESC LIMIT 1;
+--------+---------------+----------+------+------------+------+
| custid | name          | nickname | city | postalCode | age  |
+--------+---------------+----------+------+------------+------+
| C08    | Ashko Charles | AK       | USA  | 421044     |   72 |
+--------+---------------+----------+------+------------+------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT 'List the customer by second highest age';
+-----------------------------------------+
| List the customer by second highest age |
+-----------------------------------------+
| List the customer by second highest age |
+-----------------------------------------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM  Customer ORDER BY WHERE AGE > max(age);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'WHERE AGE > max(age)' at line 1
MariaDB [CSD2204S18]> SELECT * FROM  Customer ORDER BY WHERE age > max(age);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'WHERE age > max(age)' at line 1
MariaDB [CSD2204S18]> SELECT * FROM (SELECT *FROM Customer ORDER BY age DESC LIMIT 2) AS t ORDER BY age ASC LIMIT 1;
+--------+--------------+----------+----------+------------+------+
| custid | name         | nickname | city     | postalCode | age  |
+--------+--------------+----------+----------+------------+------+
| C07    | Bobby Chacko | chac     | new york | 320300     |   70 |
+--------+--------------+----------+----------+------------+------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM (SELECT *FROM Customer ORDER BY age DESC LIMIT 3) AS t ORDER BY age ASC LIMIT 1;
+--------+----------+----------+---------+------------+------+
| custid | name     | nickname | city    | postalCode | age  |
+--------+----------+----------+---------+------------+------+
| C06    | eston M. | M.       | toronto | 201023     |   65 |
+--------+----------+----------+---------+------------+------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM (SELECT *FROM Customer ORDER BY age ASC LIMIT 3) AS t ORDER BY age DESC LIMIT 1;
+--------+-------------+----------+--------+------------+------+
| custid | name        | nickname | city   | postalCode | age  |
+--------+-------------+----------+--------+------------+------+
| C04    | Denial jack | DJ       | brazil | 341020     |   25 |
+--------+-------------+----------+--------+------------+------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM (SELECT *FROM Customer ORDER BY age ASC LIMIT 2) AS t ORDER BY age DESC LIMIT 1;
+--------+------------+----------+---------+------------+------+
| custid | name       | nickname | city    | postalCode | age  |
+--------+------------+----------+---------+------------+------+
| C02    | Bob marley | bm       | Toronto | 100100     |   23 |
+--------+------------+----------+---------+------------+------+
1 row in set (0.02 sec)

MariaDB [CSD2204S18]> SELECT max(age)+10*20/2 FROM Customer;
+------------------+
| max(age)+10*20/2 |
+------------------+
|         172.0000 |
+------------------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT 10*30 AS t;
+-----+
| t   |
+-----+
| 300 |
+-----+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> exit
