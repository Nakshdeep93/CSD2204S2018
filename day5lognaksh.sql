MariaDB [(none)]> SELECT * FROM Customer;
ERROR 1046 (3D000): No database selected
MariaDB [(none)]> USE CSD22204S18;
ERROR 1049 (42000): Unknown database 'csd22204s18'
MariaDB [(none)]> USE CSD2204S18;
Database changed
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
10 rows in set (0.05 sec)

MariaDB [CSD2204S18]> CREATE TABLE Persons(
    -> ID integer(3),
    ->  LastName varchar(255) NOT NULL,
    -> Ctrl-C -- exit!
 FirstName varchar(255) NOT NULL,
    ->  Age integer(3),
    -> exit
    -> cd;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'exit
cd' at line 6
MariaDB [CSD2204S18]> CREATE TABLE Persons(
    -> ID integer(3),
    ->  LastName varchar(255) NOT NULL,
    ->  Age integer(3),
    -> CONSTAINT PK_Person PRIMARY KEY (ID,LastName));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'PK_Person PRIMARY KEY (ID,LastName))' at line 5
MariaDB [CSD2204S18]> CREATE TABLE Persons(
    -> ID integer(3),
    ->  LastName varchar(255) NOT NULL,
    ->  Age integer(3),
    -> CONSTRAINT PK_Person PRIMARY KEY (ID,LastName));
Query OK, 0 rows affected (0.30 sec)

MariaDB [CSD2204S18]> DESC Persons;
+----------+--------------+------+-----+---------+-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| ID       | int(3)       | NO   | PRI | NULL    |       |
| LastName | varchar(255) | NO   | PRI | NULL    |       |
| Age      | int(3)       | YES  |     | NULL    |       |
+----------+--------------+------+-----+---------+-------+
3 rows in set (0.06 sec)

MariaDB [CSD2204S18]> SHOW INDEX FROM Persons;
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table   | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| persons |          0 | PRIMARY  |            1 | ID          | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
| persons |          0 | PRIMARY  |            2 | LastName    | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
2 rows in set (0.00 sec)

MariaDB [CSD2204S18]> CREATE TABLE Orders(
    -> orderID integer(3) NOT NULL,
    -> orderNumber integer(3) NOT NULL,
    -> PRIMARY KEY (orderID),
    -> PersonID integer(3),
    -> CONSTRAINT FK_PersonORDER FOREIGN KEY (PersonID)
    -> REFERENCES Persons(ID));
Query OK, 0 rows affected (0.25 sec)
MariaDB [CSD2204S18]> SHOW CREATE TABLE Orders;
+--------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table  | Create Table                                                                                                                                                                                                                                                                                                      |
+--------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Orders | CREATE TABLE `orders` (
  `OrderID` int(3) NOT NULL,
  `OrderNumber` int(3) NOT NULL,
  `PersonID` int(3) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `FK_PersonOrder` (`PersonID`),
  CONSTRAINT `FK_PersonOrder` FOREIGN KEY (`PersonID`) REFERENCES `persons` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 |
+--------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SHOW INDEX FROM ORDERS;
+--------+------------+----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table  | Non_unique | Key_name       | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+--------+------------+----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| orders |          0 | PRIMARY        |            1 | OrderID     | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
| orders |          1 | FK_PersonOrder |            1 | PersonID    | A         |           0 |     NULL | NULL   | YES  | BTREE      |         |               |
+--------+------------+----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
2 rows in set (0.00 sec)

MariaDB [CSD2204S18]> CREATE TABLE C1 AS SELECT * FROM CUSTOMER;
Query OK, 10 rows affected (0.36 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> CREATE TABLE C2 AS SELECT NAME,POSTLCODE FROM CUSTOMER WHERE CITY="TORONTO";
ERROR 1054 (42S22): Unknown column 'NAME' in 'field list'
MariaDB [CSD2204S18]> DESC CUSTOMER;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| custID    | varchar(5)  | NO   | PRI | NULL    |       |
| custName  | varchar(50) | YES  |     | NULL    |       |
| nickName  | varchar(10) | YES  |     | NULL    |       |
| city      | varchar(20) | YES  |     | NULL    |       |
| postlCode | varchar(10) | YES  |     | NULL    |       |
| age       | int(3)      | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
6 rows in set (0.05 sec)

MariaDB [CSD2204S18]> CREATE TABLE C2 AS SELECT CUSTID,POSTLCODE FROM CUSTOMER WHERE CITY="TORONTO";
Query OK, 3 rows affected (0.23 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> DESC C1;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| custID    | varchar(5)  | NO   |     | NULL    |       |
| custName  | varchar(50) | YES  |     | NULL    |       |
| nickName  | varchar(10) | YES  |     | NULL    |       |
| city      | varchar(20) | YES  |     | NULL    |       |
| postlCode | varchar(10) | YES  |     | NULL    |       |
| age       | int(3)      | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM C2;
+--------+-----------+
| CUSTID | POSTLCODE |
+--------+-----------+
| CO2    | 100100    |
| CO5    | 130120    |
| CO6    | 201023    |
+--------+-----------+
3 rows in set (0.00 sec)

MariaDB [CSD2204S18]> CREATE TABLE C3 AS CUSTOMER;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'CUSTOMER' at line 1
MariaDB [CSD2204S18]> CREATE TABLE C3 AS SELECT * FROM CUSTOMER;
Query OK, 10 rows affected (0.25 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> DESC C3;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| custID    | varchar(5)  | NO   |     | NULL    |       |
| custName  | varchar(50) | YES  |     | NULL    |       |
| nickName  | varchar(10) | YES  |     | NULL    |       |
| city      | varchar(20) | YES  |     | NULL    |       |
| postlCode | varchar(10) | YES  |     | NULL    |       |
| age       | int(3)      | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM C3;
+--------+-----------------+----------+-----------+-----------+------+
| custID | custName        | nickName | city      | postlCode | age  |
+--------+-----------------+----------+-----------+-----------+------+
| CO1    | Ashley          | Ash      | WDC       | 321200    |   34 |
| CO10   | Jack Sp         | Sparrow  | New Jersy | 102301    |   32 |
| CO2    | Bob Marley      | BM       | Toronto   | 100100    |   25 |
| CO3    | Cherlies Theron | Cher     | New York  | 120134    |   26 |
| CO4    | Denial Jack     | DJ       | Brazil    | 341020    |   27 |
| CO5    |  Donna Newman   | New      | Toronto   | 130120    |   27 |
| CO6    | Eton M          | M.       | Toronto   | 201023    |   28 |
| CO7    | Bobby Chako     | Chac     | New York  | 320300    |   29 |
| CO8    | Ashko Charles   | AK       | USA       | 421044    |   30 |
| CO9    | Tony Special    | Specie   | GTA       | 418921    |   31 |
+--------+-----------------+----------+-----------+-----------+------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> INSERT INTO C3 SELECT * FROM CUSTOMER;
Query OK, 10 rows affected (0.06 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> SELECT * FROM C3;
+--------+-----------------+----------+-----------+-----------+------+
| custID | custName        | nickName | city      | postlCode | age  |
+--------+-----------------+----------+-----------+-----------+------+
| CO1    | Ashley          | Ash      | WDC       | 321200    |   34 |
| CO10   | Jack Sp         | Sparrow  | New Jersy | 102301    |   32 |
| CO2    | Bob Marley      | BM       | Toronto   | 100100    |   25 |
| CO3    | Cherlies Theron | Cher     | New York  | 120134    |   26 |
| CO4    | Denial Jack     | DJ       | Brazil    | 341020    |   27 |
| CO5    |  Donna Newman   | New      | Toronto   | 130120    |   27 |
| CO6    | Eton M          | M.       | Toronto   | 201023    |   28 |
| CO7    | Bobby Chako     | Chac     | New York  | 320300    |   29 |
| CO8    | Ashko Charles   | AK       | USA       | 421044    |   30 |
| CO9    | Tony Special    | Specie   | GTA       | 418921    |   31 |
| CO1    | Ashley          | Ash      | WDC       | 321200    |   34 |
| CO10   | Jack Sp         | Sparrow  | New Jersy | 102301    |   32 |
| CO2    | Bob Marley      | BM       | Toronto   | 100100    |   25 |
| CO3    | Cherlies Theron | Cher     | New York  | 120134    |   26 |
| CO4    | Denial Jack     | DJ       | Brazil    | 341020    |   27 |
| CO5    |  Donna Newman   | New      | Toronto   | 130120    |   27 |
| CO6    | Eton M          | M.       | Toronto   | 201023    |   28 |
| CO7    | Bobby Chako     | Chac     | New York  | 320300    |   29 |
| CO8    | Ashko Charles   | AK       | USA       | 421044    |   30 |
| CO9    | Tony Special    | Specie   | GTA       | 418921    |   31 |
+--------+-----------------+----------+-----------+-----------+------+
20 rows in set (0.00 sec)

MariaDB [CSD2204S18]> ALTER TBLE c3 ADD COLUMN country VARCHAR(100);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'TBLE c3 ADD COLUMN country VARCHAR(100)' at line 1
MariaDB [CSD2204S18]> ALTER TABLE c3 ADD COLUMN country VARCHAR(100);
Query OK, 0 rows affected (0.42 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> DESC C3;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| custID    | varchar(5)   | NO   |     | NULL    |       |
| custName  | varchar(50)  | YES  |     | NULL    |       |
| nickName  | varchar(10)  | YES  |     | NULL    |       |
| city      | varchar(20)  | YES  |     | NULL    |       |
| postlCode | varchar(10)  | YES  |     | NULL    |       |
| age       | int(3)       | YES  |     | NULL    |       |
| country   | varchar(100) | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

MariaDB [CSD2204S18]> ALTER TABLE C3 MODIFY COLUMN COUNTRY VARCHAR(40);
Query OK, 20 rows affected (0.55 sec)
Records: 20  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> DESC C3;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| custID    | varchar(5)  | NO   |     | NULL    |       |
| custName  | varchar(50) | YES  |     | NULL    |       |
| nickName  | varchar(10) | YES  |     | NULL    |       |
| city      | varchar(20) | YES  |     | NULL    |       |
| postlCode | varchar(10) | YES  |     | NULL    |       |
| age       | int(3)      | YES  |     | NULL    |       |
| COUNTRY   | varchar(40) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

MariaDB [CSD2204S18]> ALTER TABLE C3 MODIFY COLUMN Country VARCHAR(40);
Query OK, 0 rows affected (0.00 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> DESC C3;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| custID    | varchar(5)  | NO   |     | NULL    |       |
| custName  | varchar(50) | YES  |     | NULL    |       |
| nickName  | varchar(10) | YES  |     | NULL    |       |
| city      | varchar(20) | YES  |     | NULL    |       |
| postlCode | varchar(10) | YES  |     | NULL    |       |
| age       | int(3)      | YES  |     | NULL    |       |
| Country   | varchar(40) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

MariaDB [CSD2204S18]> alter table customer change column postlCode zipcode varchar(6);
Query OK, 10 rows affected (0.53 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> desc customer;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| custID   | varchar(5)  | NO   | PRI | NULL    |       |
| custName | varchar(50) | YES  |     | NULL    |       |
| nickName | varchar(10) | YES  |     | NULL    |       |
| city     | varchar(20) | YES  |     | NULL    |       |
| zipcode  | varchar(6)  | YES  |     | NULL    |       |
| age      | int(3)      | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> ALTER TABLE C3 DROP COLUMN nickname;
Query OK, 0 rows affected (2.21 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> DESC C3;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| custID    | varchar(5)  | NO   |     | NULL    |       |
| custName  | varchar(50) | YES  |     | NULL    |       |
| city      | varchar(20) | YES  |     | NULL    |       |
| postlCode | varchar(10) | YES  |     | NULL    |       |
| age       | int(3)      | YES  |     | NULL    |       |
| Country   | varchar(40) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> ALTER TABLE C3 ADD PRIMARY KEY (custID);
ERROR 1062 (23000): Duplicate entry 'CO1' for key 'PRIMARY'
MariaDB [CSD2204S18]> ALTER TABLE C3 MODIFY custName VARCHAR(50) NOT NULL;
Query OK, 20 rows affected (0.55 sec)
Records: 20  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> DESC C3;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| custID    | varchar(5)  | NO   |     | NULL    |       |
| custName  | varchar(50) | NO   |     | NULL    |       |
| city      | varchar(20) | YES  |     | NULL    |       |
| postlCode | varchar(10) | YES  |     | NULL    |       |
| age       | int(3)      | YES  |     | NULL    |       |
| Country   | varchar(40) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> DESC C1;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| custID    | varchar(5)  | NO   |     | NULL    |       |
| custName  | varchar(50) | YES  |     | NULL    |       |
| nickName  | varchar(10) | YES  |     | NULL    |       |
| city      | varchar(20) | YES  |     | NULL    |       |
| postlCode | varchar(10) | YES  |     | NULL    |       |
| age       | int(3)      | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> ALTER TABLE C1 ADD PRIMARY KEY (custID);
Query OK, 0 rows affected (0.69 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> DESC C1;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| custID    | varchar(5)  | NO   | PRI | NULL    |       |
| custName  | varchar(50) | YES  |     | NULL    |       |
| nickName  | varchar(10) | YES  |     | NULL    |       |
| city      | varchar(20) | YES  |     | NULL    |       |
| postlCode | varchar(10) | YES  |     | NULL    |       |
| age       | int(3)      | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> ALTER TABLE C1 DROP custID;
Query OK, 10 rows affected (0.59 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> DESC C1;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| custName  | varchar(50) | YES  |     | NULL    |       |
| nickName  | varchar(10) | YES  |     | NULL    |       |
| city      | varchar(20) | YES  |     | NULL    |       |
| postlCode | varchar(10) | YES  |     | NULL    |       |
| age       | int(3)      | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SHOW INDEX FROM persons;
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table   | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| persons |          0 | PRIMARY  |            1 | ID          | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
| persons |          0 | PRIMARY  |            2 | LastName    | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
2 rows in set (0.00 sec)

MariaDB [CSD2204S18]> DESC C3;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| custID    | varchar(5)  | NO   |     | NULL    |       |
| custName  | varchar(50) | NO   |     | NULL    |       |
| city      | varchar(20) | YES  |     | NULL    |       |
| postlCode | varchar(10) | YES  |     | NULL    |       |
| age       | int(3)      | YES  |     | NULL    |       |
| Country   | varchar(40) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM C3;
+--------+-----------------+-----------+-----------+------+---------+
| custID | custName        | city      | postlCode | age  | Country |
+--------+-----------------+-----------+-----------+------+---------+
| CO1    | Ashley          | WDC       | 321200    |   34 | NULL    |
| CO10   | Jack Sp         | New Jersy | 102301    |   32 | NULL    |
| CO2    | Bob Marley      | Toronto   | 100100    |   25 | NULL    |
| CO3    | Cherlies Theron | New York  | 120134    |   26 | NULL    |
| CO4    | Denial Jack     | Brazil    | 341020    |   27 | NULL    |
| CO5    |  Donna Newman   | Toronto   | 130120    |   27 | NULL    |
| CO6    | Eton M          | Toronto   | 201023    |   28 | NULL    |
| CO7    | Bobby Chako     | New York  | 320300    |   29 | NULL    |
| CO8    | Ashko Charles   | USA       | 421044    |   30 | NULL    |
| CO9    | Tony Special    | GTA       | 418921    |   31 | NULL    |
| CO1    | Ashley          | WDC       | 321200    |   34 | NULL    |
| CO10   | Jack Sp         | New Jersy | 102301    |   32 | NULL    |
| CO2    | Bob Marley      | Toronto   | 100100    |   25 | NULL    |
| CO3    | Cherlies Theron | New York  | 120134    |   26 | NULL    |
| CO4    | Denial Jack     | Brazil    | 341020    |   27 | NULL    |
| CO5    |  Donna Newman   | Toronto   | 130120    |   27 | NULL    |
| CO6    | Eton M          | Toronto   | 201023    |   28 | NULL    |
| CO7    | Bobby Chako     | New York  | 320300    |   29 | NULL    |
| CO8    | Ashko Charles   | USA       | 421044    |   30 | NULL    |
| CO9    | Tony Special    | GTA       | 418921    |   31 | NULL    |
+--------+-----------------+-----------+-----------+------+---------+
20 rows in set (0.00 sec)
MariaDB [(none)]> USE CSD2204S18;
Database changed
MariaDB [CSD2204S18]> SELECT * FROM C3;
+--------+-----------------+-----------+-----------+------+---------+
| custID | custName        | city      | postlCode | age  | Country |
+--------+-----------------+-----------+-----------+------+---------+
| CO1    | Ashley          | WDC       | 321200    |   34 | NULL    |
| CO10   | Jack Sp         | New Jersy | 102301    |   32 | NULL    |
| CO2    | Bob Marley      | Toronto   | 100100    |   25 | NULL    |
| CO3    | Cherlies Theron | New York  | 120134    |   26 | NULL    |
| CO4    | Denial Jack     | Brazil    | 341020    |   27 | NULL    |
| CO5    |  Donna Newman   | Toronto   | 130120    |   27 | NULL    |
| CO6    | Eton M          | Toronto   | 201023    |   28 | NULL    |
| CO7    | Bobby Chako     | New York  | 320300    |   29 | NULL    |
| CO8    | Ashko Charles   | USA       | 421044    |   30 | NULL    |
| CO9    | Tony Special    | GTA       | 418921    |   31 | NULL    |
| CO1    | Ashley          | WDC       | 321200    |   34 | NULL    |
| CO10   | Jack Sp         | New Jersy | 102301    |   32 | NULL    |
| CO2    | Bob Marley      | Toronto   | 100100    |   25 | NULL    |
| CO3    | Cherlies Theron | New York  | 120134    |   26 | NULL    |
| CO4    | Denial Jack     | Brazil    | 341020    |   27 | NULL    |
| CO5    |  Donna Newman   | Toronto   | 130120    |   27 | NULL    |
| CO6    | Eton M          | Toronto   | 201023    |   28 | NULL    |
| CO7    | Bobby Chako     | New York  | 320300    |   29 | NULL    |
| CO8    | Ashko Charles   | USA       | 421044    |   30 | NULL    |
| CO9    | Tony Special    | GTA       | 418921    |   31 | NULL    |
+--------+-----------------+-----------+-----------+------+---------+
20 rows in set (0.00 sec)

MariaDB [CSD2204S18]> UPDATE C3 SET country = 'USA' :
    -> UPDATE C3 SET country = 'USA';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ':
UPDATE C3 SET country = 'USA'' at line 1
MariaDB [CSD2204S18]> UPDATE C3 SET country='USA';
Query OK, 20 rows affected (0.08 sec)
Rows matched: 20  Changed: 20  Warnings: 0

MariaDB [CSD2204S18]> DESC C3;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| custID    | varchar(5)  | NO   |     | NULL    |       |
| custName  | varchar(50) | NO   |     | NULL    |       |
| city      | varchar(20) | YES  |     | NULL    |       |
| postlCode | varchar(10) | YES  |     | NULL    |       |
| age       | int(3)      | YES  |     | NULL    |       |
| Country   | varchar(40) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
6 rows in set (0.02 sec)

MariaDB [CSD2204S18]> SELECT * FROM C3;
+--------+-----------------+-----------+-----------+------+---------+
| custID | custName        | city      | postlCode | age  | Country |
+--------+-----------------+-----------+-----------+------+---------+
| CO1    | Ashley          | WDC       | 321200    |   34 | USA     |
| CO10   | Jack Sp         | New Jersy | 102301    |   32 | USA     |
| CO2    | Bob Marley      | Toronto   | 100100    |   25 | USA     |
| CO3    | Cherlies Theron | New York  | 120134    |   26 | USA     |
| CO4    | Denial Jack     | Brazil    | 341020    |   27 | USA     |
| CO5    |  Donna Newman   | Toronto   | 130120    |   27 | USA     |
| CO6    | Eton M          | Toronto   | 201023    |   28 | USA     |
| CO7    | Bobby Chako     | New York  | 320300    |   29 | USA     |
| CO8    | Ashko Charles   | USA       | 421044    |   30 | USA     |
| CO9    | Tony Special    | GTA       | 418921    |   31 | USA     |
| CO1    | Ashley          | WDC       | 321200    |   34 | USA     |
| CO10   | Jack Sp         | New Jersy | 102301    |   32 | USA     |
| CO2    | Bob Marley      | Toronto   | 100100    |   25 | USA     |
| CO3    | Cherlies Theron | New York  | 120134    |   26 | USA     |
| CO4    | Denial Jack     | Brazil    | 341020    |   27 | USA     |
| CO5    |  Donna Newman   | Toronto   | 130120    |   27 | USA     |
| CO6    | Eton M          | Toronto   | 201023    |   28 | USA     |
| CO7    | Bobby Chako     | New York  | 320300    |   29 | USA     |
| CO8    | Ashko Charles   | USA       | 421044    |   30 | USA     |
| CO9    | Tony Special    | GTA       | 418921    |   31 | USA     |
+--------+-----------------+-----------+-----------+------+---------+
20 rows in set (0.00 sec)

MariaDB [CSD2204S18]> update cust set country="canada"
    -> where city='brazil';
ERROR 1146 (42S02): Table 'csd2204s18.cust' doesn't exist
MariaDB [CSD2204S18]> UPDATE C3 SET country='south america' WHERE city='Brazil';
Query OK, 2 rows affected (0.06 sec)
Rows matched: 2  Changed: 2  Warnings: 0
MariaDB [CSD2204S18]> desc c3;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| custID    | varchar(5)  | NO   |     | NULL    |       |
| custName  | varchar(50) | NO   |     | NULL    |       |
| city      | varchar(20) | YES  |     | NULL    |       |
| postlCode | varchar(10) | YES  |     | NULL    |       |
| age       | int(3)      | YES  |     | NULL    |       |
| Country   | varchar(40) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)
MariaDB [CSD2204S18]> SELECT * FROM C3;
+--------+-----------------+-----------+-----------+------+---------------+
| custID | custName        | city      | postlCode | age  | Country       |
+--------+-----------------+-----------+-----------+------+---------------+
| CO1    | Ashley          | WDC       | 321200    |   34 | USA           |
| CO10   | Jack Sp         | New Jersy | 102301    |   32 | USA           |
| CO2    | Bob Marley      | Toronto   | 100100    |   25 | USA           |
| CO3    | Cherlies Theron | New York  | 120134    |   26 | USA           |
| CO4    | Denial Jack     | Brazil    | 341020    |   27 | south america |
| CO5    |  Donna Newman   | Toronto   | 130120    |   27 | USA           |
| CO6    | Eton M          | Toronto   | 201023    |   28 | USA           |
| CO7    | Bobby Chako     | New York  | 320300    |   29 | USA           |
| CO8    | Ashko Charles   | USA       | 421044    |   30 | USA           |
| CO9    | Tony Special    | GTA       | 418921    |   31 | USA           |
| CO1    | Ashley          | WDC       | 321200    |   34 | USA           |
| CO10   | Jack Sp         | New Jersy | 102301    |   32 | USA           |
| CO2    | Bob Marley      | Toronto   | 100100    |   25 | USA           |
| CO3    | Cherlies Theron | New York  | 120134    |   26 | USA           |
| CO4    | Denial Jack     | Brazil    | 341020    |   27 | south america |
| CO5    |  Donna Newman   | Toronto   | 130120    |   27 | USA           |
| CO6    | Eton M          | Toronto   | 201023    |   28 | USA           |
| CO7    | Bobby Chako     | New York  | 320300    |   29 | USA           |
| CO8    | Ashko Charles   | USA       | 421044    |   30 | USA           |
| CO9    | Tony Special    | GTA       | 418921    |   31 | USA           |
+--------+-----------------+-----------+-----------+------+---------------+
20 rows in set (0.00 sec)
MariaDB [CSD2204S18]> UPDATE C3 SET country='CANADA' WHERE city='TORONTO'||CITY='GTA';
Query OK, 8 rows affected (0.06 sec)
Rows matched: 8  Changed: 8  Warnings: 0
MariaDB [CSD2204S18]> SELECT * FROM C3;
+--------+-----------------+-----------+-----------+------+---------------+
| custID | custName        | city      | postlCode | age  | Country       |
+--------+-----------------+-----------+-----------+------+---------------+
| CO1    | Ashley          | WDC       | 321200    |   34 | USA           |
| CO10   | Jack Sp         | New Jersy | 102301    |   32 | USA           |
| CO2    | Bob Marley      | Toronto   | 100100    |   25 | CANADA        |
| CO3    | Cherlies Theron | New York  | 120134    |   26 | USA           |
| CO4    | Denial Jack     | Brazil    | 341020    |   27 | south america |
| CO5    |  Donna Newman   | Toronto   | 130120    |   27 | CANADA        |
| CO6    | Eton M          | Toronto   | 201023    |   28 | CANADA        |
| CO7    | Bobby Chako     | New York  | 320300    |   29 | USA           |
| CO8    | Ashko Charles   | USA       | 421044    |   30 | USA           |
| CO9    | Tony Special    | GTA       | 418921    |   31 | CANADA        |
| CO1    | Ashley          | WDC       | 321200    |   34 | USA           |
| CO10   | Jack Sp         | New Jersy | 102301    |   32 | USA           |
| CO2    | Bob Marley      | Toronto   | 100100    |   25 | CANADA        |
| CO3    | Cherlies Theron | New York  | 120134    |   26 | USA           |
| CO4    | Denial Jack     | Brazil    | 341020    |   27 | south america |
| CO5    |  Donna Newman   | Toronto   | 130120    |   27 | CANADA        |
| CO6    | Eton M          | Toronto   | 201023    |   28 | CANADA        |
| CO7    | Bobby Chako     | New York  | 320300    |   29 | USA           |
| CO8    | Ashko Charles   | USA       | 421044    |   30 | USA           |
| CO9    | Tony Special    | GTA       | 418921    |   31 | CANADA        |
+--------+-----------------+-----------+-----------+------+---------------+
20 rows in set (0.00 sec)
MariaDB [CSD2204S18]> SELECT * FROM C2;
+--------+-----------+
| CUSTID | POSTLCODE |
+--------+-----------+
| CO2    | 100100    |
| CO5    | 130120    |
| CO6    | 201023    |
+--------+-----------+
3 rows in set (0.05 sec)
MariaDB [CSD2204S18]> DELETE FROM C2 WHERE CUSTID LIKE 'CO5';
Query OK, 1 row affected (0.08 sec)
MariaDB [CSD2204S18]> SELECT * FROM C2;
+--------+-----------+
| CUSTID | POSTLCODE |
+--------+-----------+
| CO2    | 100100    |
| CO6    | 201023    |
+--------+-----------+
2 rows in set (0.00 sec)
MariaDB [CSD2204S18]> SELECT * FROM C1;
+-----------------+----------+-----------+-----------+------+
| custName        | nickName | city      | postlCode | age  |
+-----------------+----------+-----------+-----------+------+
| Ashley          | Ash      | WDC       | 321200    |   34 |
| Jack Sp         | Sparrow  | New Jersy | 102301    |   32 |
| Bob Marley      | BM       | Toronto   | 100100    |   25 |
| Cherlies Theron | Cher     | New York  | 120134    |   26 |
| Denial Jack     | DJ       | Brazil    | 341020    |   27 |
|  Donna Newman   | New      | Toronto   | 130120    |   27 |
| Eton M          | M.       | Toronto   | 201023    |   28 |
| Bobby Chako     | Chac     | New York  | 320300    |   29 |
| Ashko Charles   | AK       | USA       | 421044    |   30 |
| Tony Special    | Specie   | GTA       | 418921    |   31 |
+-----------------+----------+-----------+-----------+------+
10 rows in set (0.00 sec)
MariaDB [CSD2204S18]> ALTER TABLE C1 ADD COLUMN CUSTID;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 1
MariaDB [CSD2204S18]> ALTER TABLE C1 ADD COLUMN CUSTID VARCHAR(10);
Query OK, 0 rows affected (0.39 sec)
Records: 0  Duplicates: 0  Warnings: 0
MariaDB [CSD2204S18]> SELECT * FROM C1;
+-----------------+----------+-----------+-----------+------+--------+
| custName        | nickName | city      | postlCode | age  | CUSTID |
+-----------------+----------+-----------+-----------+------+--------+
| Ashley          | Ash      | WDC       | 321200    |   34 | NULL   |
| Jack Sp         | Sparrow  | New Jersy | 102301    |   32 | NULL   |
| Bob Marley      | BM       | Toronto   | 100100    |   25 | NULL   |
| Cherlies Theron | Cher     | New York  | 120134    |   26 | NULL   |
| Denial Jack     | DJ       | Brazil    | 341020    |   27 | NULL   |
|  Donna Newman   | New      | Toronto   | 130120    |   27 | NULL   |
| Eton M          | M.       | Toronto   | 201023    |   28 | NULL   |
| Bobby Chako     | Chac     | New York  | 320300    |   29 | NULL   |
| Ashko Charles   | AK       | USA       | 421044    |   30 | NULL   |
| Tony Special    | Specie   | GTA       | 418921    |   31 | NULL   |
+-----------------+----------+-----------+-----------+------+--------+
10 rows in set (0.00 sec)
MariaDB [CSD2204S18]> UPDATE C1 SET CUSTID='CO1' WHERE AGE>30;
Query OK, 3 rows affected (0.05 sec)
Rows matched: 3  Changed: 3  Warnings: 0
MariaDB [CSD2204S18]> SELECT * FROM C1;
+-----------------+----------+-----------+-----------+------+--------+
| custName        | nickName | city      | postlCode | age  | CUSTID |
+-----------------+----------+-----------+-----------+------+--------+
| Ashley          | Ash      | WDC       | 321200    |   34 | CO1    |
| Jack Sp         | Sparrow  | New Jersy | 102301    |   32 | CO1    |
| Bob Marley      | BM       | Toronto   | 100100    |   25 | NULL   |
| Cherlies Theron | Cher     | New York  | 120134    |   26 | NULL   |
| Denial Jack     | DJ       | Brazil    | 341020    |   27 | NULL   |
|  Donna Newman   | New      | Toronto   | 130120    |   27 | NULL   |
| Eton M          | M.       | Toronto   | 201023    |   28 | NULL   |
| Bobby Chako     | Chac     | New York  | 320300    |   29 | NULL   |
| Ashko Charles   | AK       | USA       | 421044    |   30 | NULL   |
| Tony Special    | Specie   | GTA       | 418921    |   31 | CO1    |
+-----------------+----------+-----------+-----------+------+--------+
10 rows in set (0.00 sec)
MariaDB [CSD2204S18]> SELECT * FROM C1 WHERE CUSTID IS NOT NULL;
+--------------+----------+-----------+-----------+------+--------+
| custName     | nickName | city      | postlCode | age  | CUSTID |
+--------------+----------+-----------+-----------+------+--------+
| Ashley       | Ash      | WDC       | 321200    |   34 | CO1    |
| Jack Sp      | Sparrow  | New Jersy | 102301    |   32 | CO1    |
| Tony Special | Specie   | GTA       | 418921    |   31 | CO1    |
+--------------+----------+-----------+-----------+------+--------+
3 rows in set (0.00 sec)
MariaDB [CSD2204S18]> SELECT * FROM C1 WHERE CUSTID IS NULL;
+-----------------+----------+----------+-----------+------+--------+
| custName        | nickName | city     | postlCode | age  | CUSTID |
+-----------------+----------+----------+-----------+------+--------+
| Bob Marley      | BM       | Toronto  | 100100    |   25 | NULL   |
| Cherlies Theron | Cher     | New York | 120134    |   26 | NULL   |
| Denial Jack     | DJ       | Brazil   | 341020    |   27 | NULL   |
|  Donna Newman   | New      | Toronto  | 130120    |   27 | NULL   |
| Eton M          | M.       | Toronto  | 201023    |   28 | NULL   |
| Bobby Chako     | Chac     | New York | 320300    |   29 | NULL   |
| Ashko Charles   | AK       | USA      | 421044    |   30 | NULL   |
+-----------------+----------+----------+-----------+------+--------+
7 rows in set (0.00 sec)
MariaDB [CSD2204S18]> ALTER TABLE C1 MODIFY COLUMN AGE FLOAT(10,2);
Query OK, 10 rows affected (0.67 sec)
Records: 10  Duplicates: 0  Warnings: 0
MariaDB [CSD2204S18]> SELECT * FROM C1 WHERE CUSTID;
Empty set, 3 warnings (0.00 sec)
MariaDB [CSD2204S18]> SELECT * FROM C1;
+-----------------+----------+-----------+-----------+-------+--------+
| custName        | nickName | city      | postlCode | AGE   | CUSTID |
+-----------------+----------+-----------+-----------+-------+--------+
| Ashley          | Ash      | WDC       | 321200    | 34.00 | CO1    |
| Jack Sp         | Sparrow  | New Jersy | 102301    | 32.00 | CO1    |
| Bob Marley      | BM       | Toronto   | 100100    | 25.00 | NULL   |
| Cherlies Theron | Cher     | New York  | 120134    | 26.00 | NULL   |
| Denial Jack     | DJ       | Brazil    | 341020    | 27.00 | NULL   |
|  Donna Newman   | New      | Toronto   | 130120    | 27.00 | NULL   |
| Eton M          | M.       | Toronto   | 201023    | 28.00 | NULL   |
| Bobby Chako     | Chac     | New York  | 320300    | 29.00 | NULL   |
| Ashko Charles   | AK       | USA       | 421044    | 30.00 | NULL   |
| Tony Special    | Specie   | GTA       | 418921    | 31.00 | CO1    |
+-----------------+----------+-----------+-----------+-------+--------+
10 rows in set (0.00 sec)
MariaDB [CSD2204S18]> exit;
