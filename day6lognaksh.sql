MariaDB [(none)]> SHOW databases;
+--------------------+
| Database           |
+--------------------+
| csd2204s18         |
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
| test               |
+--------------------+
6 rows in set (0.02 sec)

MariaDB [(none)]> show tables;
ERROR 1046 (3D000): No database selected
MariaDB [(none)]> use csd2204s18;
Database changed
MariaDB [csd2204s18]> show tables;
+----------------------+
| Tables_in_csd2204s18 |
+----------------------+
| c1                   |
| c2                   |
| c3                   |
| customer             |
| orders               |
| persons              |
+----------------------+
6 rows in set (0.00 sec)

MariaDB [csd2204s18]> select * from Customer;
+--------+-----------------+----------+-----------+------------+------+
| custid | name            | nickname | city      | postalCode | age  |
+--------+-----------------+----------+-----------+------------+------+
| C01    | ashley          | ash      | WDC       | 321200     |   34 |
| C02    | Bob marley      | bm       | Toronto   | 100100     |   23 |
| C03    | cherlies theron | cher     | New york  | 120134     |   20 |
| C04    | Denial jack     | DJ       | brazil    | 12345      |   25 |
| C05    | Donna newman    | new      | toronto   | 130120     |   50 |
| C06    | eston M.        | M.       | toronto   | 201023     |   65 |
| C07    | Bobby Chacko    | chac     | new york  | 320300     |   70 |
| C08    | Ashko Charles   | AK       | USA       | 421044     |   72 |
| C09    | Tony special    | Specie   | GTA       | 418921     |   62 |
| C10    | Jack sp         | Sparrow  | New jersy | 102301     |   58 |
+--------+-----------------+----------+-----------+------------+------+
10 rows in set (0.05 sec)

MariaDB [csd2204s18]> select * from Customer ORDER BY name ASC: 
    -> \G
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ':' at line 1
MariaDB [csd2204s18]> select * from Customer ORDER BY name,city ASC; 
+--------+-----------------+----------+-----------+------------+------+
| custid | name            | nickname | city      | postalCode | age  |
+--------+-----------------+----------+-----------+------------+------+
| C08    | Ashko Charles   | AK       | USA       | 421044     |   72 |
| C01    | ashley          | ash      | WDC       | 321200     |   34 |
| C02    | Bob marley      | bm       | Toronto   | 100100     |   23 |
| C07    | Bobby Chacko    | chac     | new york  | 320300     |   70 |
| C03    | cherlies theron | cher     | New york  | 120134     |   20 |
| C04    | Denial jack     | DJ       | brazil    | 12345      |   25 |
| C05    | Donna newman    | new      | toronto   | 130120     |   50 |
| C06    | eston M.        | M.       | toronto   | 201023     |   65 |
| C10    | Jack sp         | Sparrow  | New jersy | 102301     |   58 |
| C09    | Tony special    | Specie   | GTA       | 418921     |   62 |
+--------+-----------------+----------+-----------+------------+------+
10 rows in set (0.00 sec)

MariaDB [csd2204s18]> select * from Customer ORDER BY name DESC,city ASC; 
+--------+-----------------+----------+-----------+------------+------+
| custid | name            | nickname | city      | postalCode | age  |
+--------+-----------------+----------+-----------+------------+------+
| C09    | Tony special    | Specie   | GTA       | 418921     |   62 |
| C10    | Jack sp         | Sparrow  | New jersy | 102301     |   58 |
| C06    | eston M.        | M.       | toronto   | 201023     |   65 |
| C05    | Donna newman    | new      | toronto   | 130120     |   50 |
| C04    | Denial jack     | DJ       | brazil    | 12345      |   25 |
| C03    | cherlies theron | cher     | New york  | 120134     |   20 |
| C07    | Bobby Chacko    | chac     | new york  | 320300     |   70 |
| C02    | Bob marley      | bm       | Toronto   | 100100     |   23 |
| C01    | ashley          | ash      | WDC       | 321200     |   34 |
| C08    | Ashko Charles   | AK       | USA       | 421044     |   72 |
+--------+-----------------+----------+-----------+------------+------+
10 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM Customer ORDER BY Customerid DESC LIMIT 3;
ERROR 1054 (42S22): Unknown column 'Customerid' in 'order clause'
MariaDB [csd2204s18]> SELECT * FROM Customer ORDER BY Custid DESC LIMIT 3;
+--------+---------------+----------+-----------+------------+------+
| custid | name          | nickname | city      | postalCode | age  |
+--------+---------------+----------+-----------+------------+------+
| C10    | Jack sp       | Sparrow  | New jersy | 102301     |   58 |
| C09    | Tony special  | Specie   | GTA       | 418921     |   62 |
| C08    | Ashko Charles | AK       | USA       | 421044     |   72 |
+--------+---------------+----------+-----------+------------+------+
3 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT* FROM Customer ORDER BY Custid ASC LIMIT 3;
+--------+-----------------+----------+----------+------------+------+
| custid | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| C01    | ashley          | ash      | WDC      | 321200     |   34 |
| C02    | Bob marley      | bm       | Toronto  | 100100     |   23 |
| C03    | cherlies theron | cher     | New york | 120134     |   20 |
+--------+-----------------+----------+----------+------------+------+
3 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT* FROM (SELECT * FROM customer ORDER BY custid DESC LIMIT 3) Customer ORDER BY Custid ASC LIMIT 3;
+--------+---------------+----------+-----------+------------+------+
| custid | name          | nickname | city      | postalCode | age  |
+--------+---------------+----------+-----------+------------+------+
| C08    | Ashko Charles | AK       | USA       | 421044     |   72 |
| C09    | Tony special  | Specie   | GTA       | 418921     |   62 |
| C10    | Jack sp       | Sparrow  | New jersy | 102301     |   58 |
+--------+---------------+----------+-----------+------------+------+
3 rows in set (0.01 sec)

MariaDB [csd2204s18]> SELECT * FROM Customer;
+--------+-----------------+----------+-----------+------------+------+
| custid | name            | nickname | city      | postalCode | age  |
+--------+-----------------+----------+-----------+------------+------+
| C01    | ashley          | ash      | WDC       | 321200     |   34 |
| C02    | Bob marley      | bm       | Toronto   | 100100     |   23 |
| C03    | cherlies theron | cher     | New york  | 120134     |   20 |
| C04    | Denial jack     | DJ       | brazil    | 12345      |   25 |
| C05    | Donna newman    | new      | toronto   | 130120     |   50 |
| C06    | eston M.        | M.       | toronto   | 201023     |   65 |
| C07    | Bobby Chacko    | chac     | new york  | 320300     |   70 |
| C08    | Ashko Charles   | AK       | USA       | 421044     |   72 |
| C09    | Tony special    | Specie   | GTA       | 418921     |   62 |
| C10    | Jack sp         | Sparrow  | New jersy | 102301     |   58 |
+--------+-----------------+----------+-----------+------------+------+
10 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM Customer GROUP BY city;
+--------+-----------------+----------+-----------+------------+------+
| custid | name            | nickname | city      | postalCode | age  |
+--------+-----------------+----------+-----------+------------+------+
| C04    | Denial jack     | DJ       | brazil    | 12345      |   25 |
| C09    | Tony special    | Specie   | GTA       | 418921     |   62 |
| C10    | Jack sp         | Sparrow  | New jersy | 102301     |   58 |
| C03    | cherlies theron | cher     | New york  | 120134     |   20 |
| C02    | Bob marley      | bm       | Toronto   | 100100     |   23 |
| C08    | Ashko Charles   | AK       | USA       | 421044     |   72 |
| C01    | ashley          | ash      | WDC       | 321200     |   34 |
+--------+-----------------+----------+-----------+------------+------+
7 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT city FROM Customer GROUP BY city;
+-----------+
| city      |
+-----------+
| brazil    |
| GTA       |
| New jersy |
| New york  |
| Toronto   |
| USA       |
| WDC       |
+-----------+
7 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT COUNT(city) "unique cities" FROM Customer GROUP BY city;
+---------------+
| unique cities |
+---------------+
|             1 |
|             1 |
|             1 |
|             2 |
|             3 |
|             1 |
|             1 |
+---------------+
7 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT city, COUNT(city) "unique cities" FROM Customer GROUP BY city;
+-----------+---------------+
| city      | unique cities |
+-----------+---------------+
| brazil    |             1 |
| GTA       |             1 |
| New jersy |             1 |
| New york  |             2 |
| Toronto   |             3 |
| USA       |             1 |
| WDC       |             1 |
+-----------+---------------+
7 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT COUNT(*) "unique cities" FROM Customer GROUP BY city;
+---------------+
| unique cities |
+---------------+
|             1 |
|             1 |
|             1 |
|             2 |
|             3 |
|             1 |
|             1 |
+---------------+
7 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT DISTINCT(city) FROM Customer;
+-----------+
| city      |
+-----------+
| WDC       |
| Toronto   |
| New york  |
| brazil    |
| USA       |
| GTA       |
| New jersy |
+-----------+
7 rows in set (0.06 sec)

MariaDB [csd2204s18]> SELECT city,count(city) "no. of customers" from Customer group by city having city like 'New%' or city='toronto';
+-----------+------------------+
| city      | no. of customers |
+-----------+------------------+
| New jersy |                1 |
| New york  |                2 |
| Toronto   |                3 |
+-----------+------------------+
3 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT city,count(city) "no. of customers" from Customer group by city having count(city)>2;
+---------+------------------+
| city    | no. of customers |
+---------+------------------+
| Toronto |                3 |
+---------+------------------+
1 row in set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM Customer WHERE name REGEXP 'n$';
+--------+-----------------+----------+----------+------------+------+
| custid | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| C03    | cherlies theron | cher     | New york | 120134     |   20 |
| C05    | Donna newman    | new      | toronto  | 130120     |   50 |
+--------+-----------------+----------+----------+------------+------+
2 rows in set (0.06 sec)

MariaDB [csd2204s18]> SELECT * FROM Customer WHERE name REGEXP '^D';
+--------+--------------+----------+---------+------------+------+
| custid | name         | nickname | city    | postalCode | age  |
+--------+--------------+----------+---------+------------+------+
| C04    | Denial jack  | DJ       | brazil  | 12345      |   25 |
| C05    | Donna newman | new      | toronto | 130120     |   50 |
+--------+--------------+----------+---------+------------+------+
2 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM Customer WHERE name REGEXP '^..a';
Empty set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM Customer WHERE name REGEXP '^..e';
+--------+-----------------+----------+----------+------------+------+
| custid | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| C03    | cherlies theron | cher     | New york | 120134     |   20 |
+--------+-----------------+----------+----------+------------+------+
1 row in set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM Customer WHERE postalCode REGEXP '^[0=9]';
Empty set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM Customer WHERE postalCode REGEXP '^[0-9]';
+--------+-----------------+----------+-----------+------------+------+
| custid | name            | nickname | city      | postalCode | age  |
+--------+-----------------+----------+-----------+------------+------+
| C01    | ashley          | ash      | WDC       | 321200     |   34 |
| C02    | Bob marley      | bm       | Toronto   | 100100     |   23 |
| C03    | cherlies theron | cher     | New york  | 120134     |   20 |
| C04    | Denial jack     | DJ       | brazil    | 12345      |   25 |
| C05    | Donna newman    | new      | toronto   | 130120     |   50 |
| C06    | eston M.        | M.       | toronto   | 201023     |   65 |
| C07    | Bobby Chacko    | chac     | new york  | 320300     |   70 |
| C08    | Ashko Charles   | AK       | USA       | 421044     |   72 |
| C09    | Tony special    | Specie   | GTA       | 418921     |   62 |
| C10    | Jack sp         | Sparrow  | New jersy | 102301     |   58 |
+--------+-----------------+----------+-----------+------------+------+
10 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM Customer WHERE postalCode REGEXP '^[A-Z]';
Empty set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM Customer WHERE postalCode REGEXP '^A*';
+--------+-----------------+----------+-----------+------------+------+
| custid | name            | nickname | city      | postalCode | age  |
+--------+-----------------+----------+-----------+------------+------+
| C01    | ashley          | ash      | WDC       | 321200     |   34 |
| C02    | Bob marley      | bm       | Toronto   | 100100     |   23 |
| C03    | cherlies theron | cher     | New york  | 120134     |   20 |
| C04    | Denial jack     | DJ       | brazil    | 12345      |   25 |
| C05    | Donna newman    | new      | toronto   | 130120     |   50 |
| C06    | eston M.        | M.       | toronto   | 201023     |   65 |
| C07    | Bobby Chacko    | chac     | new york  | 320300     |   70 |
| C08    | Ashko Charles   | AK       | USA       | 421044     |   72 |
| C09    | Tony special    | Specie   | GTA       | 418921     |   62 |
| C10    | Jack sp         | Sparrow  | New jersy | 102301     |   58 |
+--------+-----------------+----------+-----------+------------+------+
10 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM Customer WHERE postalCode REGEXP '^A+';
Empty set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM Customer WHERE postalCode REGEXP '^A?';
+--------+-----------------+----------+-----------+------------+------+
| custid | name            | nickname | city      | postalCode | age  |
+--------+-----------------+----------+-----------+------------+------+
| C01    | ashley          | ash      | WDC       | 321200     |   34 |
| C02    | Bob marley      | bm       | Toronto   | 100100     |   23 |
| C03    | cherlies theron | cher     | New york  | 120134     |   20 |
| C04    | Denial jack     | DJ       | brazil    | 12345      |   25 |
| C05    | Donna newman    | new      | toronto   | 130120     |   50 |
| C06    | eston M.        | M.       | toronto   | 201023     |   65 |
| C07    | Bobby Chacko    | chac     | new york  | 320300     |   70 |
| C08    | Ashko Charles   | AK       | USA       | 421044     |   72 |
| C09    | Tony special    | Specie   | GTA       | 418921     |   62 |
| C10    | Jack sp         | Sparrow  | New jersy | 102301     |   58 |
+--------+-----------------+----------+-----------+------------+------+
10 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM Customer WHERE postalCode REGEXP '^.{4}';
+--------+-----------------+----------+-----------+------------+------+
| custid | name            | nickname | city      | postalCode | age  |
+--------+-----------------+----------+-----------+------------+------+
| C01    | ashley          | ash      | WDC       | 321200     |   34 |
| C02    | Bob marley      | bm       | Toronto   | 100100     |   23 |
| C03    | cherlies theron | cher     | New york  | 120134     |   20 |
| C04    | Denial jack     | DJ       | brazil    | 12345      |   25 |
| C05    | Donna newman    | new      | toronto   | 130120     |   50 |
| C06    | eston M.        | M.       | toronto   | 201023     |   65 |
| C07    | Bobby Chacko    | chac     | new york  | 320300     |   70 |
| C08    | Ashko Charles   | AK       | USA       | 421044     |   72 |
| C09    | Tony special    | Specie   | GTA       | 418921     |   62 |
| C10    | Jack sp         | Sparrow  | New jersy | 102301     |   58 |
+--------+-----------------+----------+-----------+------------+------+
10 rows in set (0.02 sec)

MariaDB [csd2204s18]> SELECT * FROM Customer WHERE city REGEXP '^.{4}';
+--------+-----------------+----------+-----------+------------+------+
| custid | name            | nickname | city      | postalCode | age  |
+--------+-----------------+----------+-----------+------------+------+
| C02    | Bob marley      | bm       | Toronto   | 100100     |   23 |
| C03    | cherlies theron | cher     | New york  | 120134     |   20 |
| C04    | Denial jack     | DJ       | brazil    | 12345      |   25 |
| C05    | Donna newman    | new      | toronto   | 130120     |   50 |
| C06    | eston M.        | M.       | toronto   | 201023     |   65 |
| C07    | Bobby Chacko    | chac     | new york  | 320300     |   70 |
| C10    | Jack sp         | Sparrow  | New jersy | 102301     |   58 |
+--------+-----------------+----------+-----------+------------+------+
7 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM Customer WHERE city REGEXP '^b{4}';
Empty set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM Customer WHERE city Rlike '^b{4}';
Empty set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM Customer WHERE city Rlike '^.{4}';
+--------+-----------------+----------+-----------+------------+------+
| custid | name            | nickname | city      | postalCode | age  |
+--------+-----------------+----------+-----------+------------+------+
| C02    | Bob marley      | bm       | Toronto   | 100100     |   23 |
| C03    | cherlies theron | cher     | New york  | 120134     |   20 |
| C04    | Denial jack     | DJ       | brazil    | 12345      |   25 |
| C05    | Donna newman    | new      | toronto   | 130120     |   50 |
| C06    | eston M.        | M.       | toronto   | 201023     |   65 |
| C07    | Bobby Chacko    | chac     | new york  | 320300     |   70 |
| C10    | Jack sp         | Sparrow  | New jersy | 102301     |   58 |
+--------+-----------------+----------+-----------+------------+------+
7 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM Customer WHERE city Rlike '^b.{4}';
+--------+-------------+----------+--------+------------+------+
| custid | name        | nickname | city   | postalCode | age  |
+--------+-------------+----------+--------+------------+------+
| C04    | Denial jack | DJ       | brazil | 12345      |   25 |
+--------+-------------+----------+--------+------------+------+
1 row in set (0.00 sec)

MariaDB [csd2204s18]> SELECT CURDATE();
+------------+
| CURDATE()  |
+------------+
| 2018-05-14 |
+------------+
1 row in set (0.05 sec)

MariaDB [csd2204s18]> SELECT NOW();
+---------------------+
| NOW()               |
+---------------------+
| 2018-05-14 09:15:04 |
+---------------------+
1 row in set (0.00 sec)

MariaDB [csd2204s18]> SELECT NOW();
+---------------------+
| NOW()               |
+---------------------+
| 2018-05-14 09:15:18 |
+---------------------+
1 row in set (0.00 sec)

MariaDB [csd2204s18]> ALTER TABLE Customer ADD COLUMN DOB DATE;
Query OK, 0 rows affected (0.33 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [csd2204s18]> SELECT*FROM Customer;
+--------+-----------------+----------+-----------+------------+------+------+
| custid | name            | nickname | city      | postalCode | age  | DOB  |
+--------+-----------------+----------+-----------+------------+------+------+
| C01    | ashley          | ash      | WDC       | 321200     |   34 | NULL |
| C02    | Bob marley      | bm       | Toronto   | 100100     |   23 | NULL |
| C03    | cherlies theron | cher     | New york  | 120134     |   20 | NULL |
| C04    | Denial jack     | DJ       | brazil    | 12345      |   25 | NULL |
| C05    | Donna newman    | new      | toronto   | 130120     |   50 | NULL |
| C06    | eston M.        | M.       | toronto   | 201023     |   65 | NULL |
| C07    | Bobby Chacko    | chac     | new york  | 320300     |   70 | NULL |
| C08    | Ashko Charles   | AK       | USA       | 421044     |   72 | NULL |
| C09    | Tony special    | Specie   | GTA       | 418921     |   62 | NULL |
| C10    | Jack sp         | Sparrow  | New jersy | 102301     |   58 | NULL |
+--------+-----------------+----------+-----------+------------+------+------+
10 rows in set (0.00 sec)

MariaDB [csd2204s18]> UPDATE Customer SET dob='1991/01/10' WHERE custid='c01';
Query OK, 1 row affected (0.08 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> SELECT*FROM Customer;
+--------+-----------------+----------+-----------+------------+------+------------+
| custid | name            | nickname | city      | postalCode | age  | DOB        |
+--------+-----------------+----------+-----------+------------+------+------------+
| C01    | ashley          | ash      | WDC       | 321200     |   34 | 1991-01-10 |
| C02    | Bob marley      | bm       | Toronto   | 100100     |   23 | NULL       |
| C03    | cherlies theron | cher     | New york  | 120134     |   20 | NULL       |
| C04    | Denial jack     | DJ       | brazil    | 12345      |   25 | NULL       |
| C05    | Donna newman    | new      | toronto   | 130120     |   50 | NULL       |
| C06    | eston M.        | M.       | toronto   | 201023     |   65 | NULL       |
| C07    | Bobby Chacko    | chac     | new york  | 320300     |   70 | NULL       |
| C08    | Ashko Charles   | AK       | USA       | 421044     |   72 | NULL       |
| C09    | Tony special    | Specie   | GTA       | 418921     |   62 | NULL       |
| C10    | Jack sp         | Sparrow  | New jersy | 102301     |   58 | NULL       |
+--------+-----------------+----------+-----------+------------+------+------------+
10 rows in set (0.00 sec)

MariaDB [csd2204s18]> UPDATE Customer SET dob='1994/02/10' WHERE custid='c01';
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> SELECT*FROM Customer;
+--------+-----------------+----------+-----------+------------+------+------------+
| custid | name            | nickname | city      | postalCode | age  | DOB        |
+--------+-----------------+----------+-----------+------------+------+------------+
| C01    | ashley          | ash      | WDC       | 321200     |   34 | 1994-02-10 |
| C02    | Bob marley      | bm       | Toronto   | 100100     |   23 | NULL       |
| C03    | cherlies theron | cher     | New york  | 120134     |   20 | NULL       |
| C04    | Denial jack     | DJ       | brazil    | 12345      |   25 | NULL       |
| C05    | Donna newman    | new      | toronto   | 130120     |   50 | NULL       |
| C06    | eston M.        | M.       | toronto   | 201023     |   65 | NULL       |
| C07    | Bobby Chacko    | chac     | new york  | 320300     |   70 | NULL       |
| C08    | Ashko Charles   | AK       | USA       | 421044     |   72 | NULL       |
| C09    | Tony special    | Specie   | GTA       | 418921     |   62 | NULL       |
| C10    | Jack sp         | Sparrow  | New jersy | 102301     |   58 | NULL       |
+--------+-----------------+----------+-----------+------------+------+------------+
10 rows in set (0.00 sec)

MariaDB [csd2204s18]> UPDATE Customer SET dob='1993/05/10' WHERE custid='c02';
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> UPDATE Customer SET dob='1995/08/15' WHERE custid='c03';
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> UPDATE Customer SET dob='1998/08/15' WHERE custid='c04';
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> UPDATE Customer SET dob='1998/10/18' WHERE custid='c05';
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> UPDATE Customer SET dob='1992/10/18' WHERE custid='c06';
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> UPDATE Customer SET dob='1993/8/06' WHERE custid='c07';
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> UPDATE Customer SET dob='1993/7/04' WHERE custid='c07';
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> UPDATE Customer SET dob='19987/04' WHERE custid='c08';
Query OK, 1 row affected, 1 warning (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 1

MariaDB [csd2204s18]> UPDATE Customer SET dob='1987/05/4' WHERE custid='c09';
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> UPDATE Customer SET dob='1985/05/14' WHERE custid='c10';
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> select* from customer;
+--------+-----------------+----------+-----------+------------+------+------------+
| custid | name            | nickname | city      | postalCode | age  | DOB        |
+--------+-----------------+----------+-----------+------------+------+------------+
| C01    | ashley          | ash      | WDC       | 321200     |   34 | 1994-02-10 |
| C02    | Bob marley      | bm       | Toronto   | 100100     |   23 | 1993-05-10 |
| C03    | cherlies theron | cher     | New york  | 120134     |   20 | 1995-08-15 |
| C04    | Denial jack     | DJ       | brazil    | 12345      |   25 | 1998-08-15 |
| C05    | Donna newman    | new      | toronto   | 130120     |   50 | 1998-10-18 |
| C06    | eston M.        | M.       | toronto   | 201023     |   65 | 1992-10-18 |
| C07    | Bobby Chacko    | chac     | new york  | 320300     |   70 | 1993-07-04 |
| C08    | Ashko Charles   | AK       | USA       | 421044     |   72 | 0000-00-00 |
| C09    | Tony special    | Specie   | GTA       | 418921     |   62 | 1987-05-04 |
| C10    | Jack sp         | Sparrow  | New jersy | 102301     |   58 | 1985-05-14 |
+--------+-----------------+----------+-----------+------------+------+------------+
10 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT NAME,DOB, TIMESTAMPDIFF(YEAR,DOB,CURDATE()) "AGE" FROM Customer;
+-----------------+------------+------+
| NAME            | DOB        | AGE  |
+-----------------+------------+------+
| ashley          | 1994-02-10 |   24 |
| Bob marley      | 1993-05-10 |   25 |
| cherlies theron | 1995-08-15 |   22 |
| Denial jack     | 1998-08-15 |   19 |
| Donna newman    | 1998-10-18 |   19 |
| eston M.        | 1992-10-18 |   25 |
| Bobby Chacko    | 1993-07-04 |   24 |
| Ashko Charles   | 0000-00-00 | NULL |
| Tony special    | 1987-05-04 |   31 |
| Jack sp         | 1985-05-14 |   33 |
+-----------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [csd2204s18]> UPDATE Customer SET dob='1985/05/14' WHERE custid='c08';
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> SELECT NAME,DOB, TIMESTAMPDIFF(YEAR,DOB,CURDATE()) "AGE" FROM Customer;
+-----------------+------------+------+
| NAME            | DOB        | AGE  |
+-----------------+------------+------+
| ashley          | 1994-02-10 |   24 |
| Bob marley      | 1993-05-10 |   25 |
| cherlies theron | 1995-08-15 |   22 |
| Denial jack     | 1998-08-15 |   19 |
| Donna newman    | 1998-10-18 |   19 |
| eston M.        | 1992-10-18 |   25 |
| Bobby Chacko    | 1993-07-04 |   24 |
| Ashko Charles   | 1985-05-14 |   33 |
| Tony special    | 1987-05-04 |   31 |
| Jack sp         | 1985-05-14 |   33 |
+-----------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT NAME,DOB, TIMESTAMPDIFF(day,DOB,CURDATE()) "AGE" FROM Customer;
+-----------------+------------+-------+
| NAME            | DOB        | AGE   |
+-----------------+------------+-------+
| ashley          | 1994-02-10 |  8859 |
| Bob marley      | 1993-05-10 |  9135 |
| cherlies theron | 1995-08-15 |  8308 |
| Denial jack     | 1998-08-15 |  7212 |
| Donna newman    | 1998-10-18 |  7148 |
| eston M.        | 1992-10-18 |  9339 |
| Bobby Chacko    | 1993-07-04 |  9080 |
| Ashko Charles   | 1985-05-14 | 12053 |
| Tony special    | 1987-05-04 | 11333 |
| Jack sp         | 1985-05-14 | 12053 |
+-----------------+------------+-------+
10 rows in set (0.00 sec)

MariaDB [csd2204s18]> UPDATE Customer SET dob='1995/09/22' WHERE custid='c08';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> SELECT NAME,DOB, TIMESTAMPDIFF(day,DOB,CURDATE()) "AGE" FROM Customer;
+-----------------+------------+-------+
| NAME            | DOB        | AGE   |
+-----------------+------------+-------+
| ashley          | 1994-02-10 |  8859 |
| Bob marley      | 1993-05-10 |  9135 |
| cherlies theron | 1995-08-15 |  8308 |
| Denial jack     | 1998-08-15 |  7212 |
| Donna newman    | 1998-10-18 |  7148 |
| eston M.        | 1992-10-18 |  9339 |
| Bobby Chacko    | 1993-07-04 |  9080 |
| Ashko Charles   | 1995-09-22 |  8270 |
| Tony special    | 1987-05-04 | 11333 |
| Jack sp         | 1985-05-14 | 12053 |
+-----------------+------------+-------+
10 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT NAME FROM Customer WHERE age=22;
Empty set (0.00 sec)

MariaDB [csd2204s18]> SELECT NAME,DOB, TIMESTAMPDIFF(day,DOB,CURDATE()) "AGE" FROM Customer having age = 22; 
Empty set (0.00 sec)

MariaDB [csd2204s18]> SELECT NAME,DOB, TIMESTAMPDIFF(day,DOB,CURDATE()) "AGE" FROM Customer WHERE age = 22; 
Empty set (0.00 sec)

MariaDB [csd2204s18]> SELECT NAME,DOB, TIMESTAMPDIFF(day,DOB,CURDATE()) "AGE" FROM Customer HAVING  age = 22; 
Empty set (0.00 sec)

MariaDB [csd2204s18]> select* from customer;
+--------+-----------------+----------+-----------+------------+------+------------+
| custid | name            | nickname | city      | postalCode | age  | DOB        |
+--------+-----------------+----------+-----------+------------+------+------------+
| C01    | ashley          | ash      | WDC       | 321200     |   34 | 1994-02-10 |
| C02    | Bob marley      | bm       | Toronto   | 100100     |   23 | 1993-05-10 |
| C03    | cherlies theron | cher     | New york  | 120134     |   20 | 1995-08-15 |
| C04    | Denial jack     | DJ       | brazil    | 12345      |   25 | 1998-08-15 |
| C05    | Donna newman    | new      | toronto   | 130120     |   50 | 1998-10-18 |
| C06    | eston M.        | M.       | toronto   | 201023     |   65 | 1992-10-18 |
| C07    | Bobby Chacko    | chac     | new york  | 320300     |   70 | 1993-07-04 |
| C08    | Ashko Charles   | AK       | USA       | 421044     |   72 | 1995-09-22 |
| C09    | Tony special    | Specie   | GTA       | 418921     |   62 | 1987-05-04 |
| C10    | Jack sp         | Sparrow  | New jersy | 102301     |   58 | 1985-05-14 |
+--------+-----------------+----------+-----------+------------+------+------------+
10 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT NAME,DOB, TIMESTAMPDIFF(YEAR,DOB,CURDATE()) "AGE" FROM Customer;
+-----------------+------------+------+
| NAME            | DOB        | AGE  |
+-----------------+------------+------+
| ashley          | 1994-02-10 |   24 |
| Bob marley      | 1993-05-10 |   25 |
| cherlies theron | 1995-08-15 |   22 |
| Denial jack     | 1998-08-15 |   19 |
| Donna newman    | 1998-10-18 |   19 |
| eston M.        | 1992-10-18 |   25 |
| Bobby Chacko    | 1993-07-04 |   24 |
| Ashko Charles   | 1995-09-22 |   22 |
| Tony special    | 1987-05-04 |   31 |
| Jack sp         | 1985-05-14 |   33 |
+-----------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT NAME,DOB, TIMESTAMPDIFF(YEAR,DOB,CURDATE()) "AGE" FROM Customer HAVING AGE = 22;
+-----------------+------------+------+
| NAME            | DOB        | AGE  |
+-----------------+------------+------+
| cherlies theron | 1995-08-15 |   22 |
| Ashko Charles   | 1995-09-22 |   22 |
+-----------------+------------+------+
2 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT NAME,DOB, TIMESTAMPDIFF(YEAR,DOB,CURDATE()) "AGE" FROM Customer WHERE TIMESTAMPDIFF(YEAR,DOB,CURDATE()) 22;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '22' at line 1
MariaDB [csd2204s18]> SELECT NAME,DOB, TIMESTAMPDIFF(YEAR,DOB,CURDATE()) "AGE" FROM Customer WHERE TIMESTAMPDIFF(YEAR,DOB,CURDATE()) = 22;
+-----------------+------------+------+
| NAME            | DOB        | AGE  |
+-----------------+------------+------+
| cherlies theron | 1995-08-15 |   22 |
| Ashko Charles   | 1995-09-22 |   22 |
+-----------------+------------+------+
2 rows in set (0.00 sec)

