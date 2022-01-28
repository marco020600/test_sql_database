riga per generare un conflitto nel merge

CREATE DATABASE pizzeria_da_luigi;

/*2. All'interno del database crea una una tabella "ordine" con i seguenti campi 
    - id --> numerico non nullo
    - nome_pizza --> text 
    - nome_cliente --> text 
    - data_ordine --> datetime
    - totale_ordine --> double 
*/

CREATE TABLE ordine (
id int NOT NULL,
nome_pizza   varchar(50),
nome_cliente  varchar(30),
data_ordine  timestamp,
totale_ordine decimal(10,2)
);

/*
3. Popolare la tabella con almeno 10 righe (ripetere almeno una volta il nome della pizza e/o il nome cliente)
    es: 0, "Margherita", "Davide", 14/01/2022, 5.5
        1, "Peperoni", "Davide", 14/01/2022, 7
        2, "Margherita", "Marco", 14/01/2022, 5.5
        3, "4 Formaggi", "Carla", 15/01/2022, 8
*/
INSERT INTO ordine(id,nome_pizza,nome_cliente,data_ordine,totale_ordine) 
VALUES
(1, 'Margherita', 'Marco', '1/01/2022 20:10', 5.5),
(2, 'Cotto', 'Michele', '7/01/2022 21:00', 6.5),
(3, 'Diavola', 'jacopo', '12/01/2022 21:20', 6.5),
(4, 'Margherita', 'Marco', '11/01/2022 20:40', 5.5),
(5, '4 formaggi', 'Sara', '10/01/2022 20:30', 7),
(6, 'Marinara', 'Elena', '9/01/2022 22:00', 5),
(7, 'Diavola', 'Maria', '13/01/2022 21:40', 6.5),
(8, 'Marinara', 'Antonio', '4/01/2022 20:25', 5),
(9, 'Capricciosa', 'Simona', '14/01/2022 20:00', 7.5);
--Scrivere una query che selezioni: 

--4. tutte le colonne dalla tabella "ordine" senza ordinamento o selezioni 

select * from ordine;

--5. solamente le colonne "id", "totale_ordine", "data_ordine"

select id, totale_ordine, data_ordine from ordine;

--6. Tutti i clienti presenti nella tabella ma senza ripetizioni dei record

SELECT DISTINCT nome_cliente from ordine;

--7. Le pizze ordinate da uno specifico cliente (es Davide)

SELECT nome_pizza FROM ordine
WHERE nome_cliente = 'Marco';

--8. Le pizze ordinate in una specifica data

SELECT nome_pizza FROM ordine 
WHERE data_ordine BETWEEN '2022/01/14 00:00' AND '2022/01/14 23:59'; 

--9. Le righe che hanno come nome della pizza "margherita" e come cliente "Davide"

SELECT * FROM ordine
WHERE nome_pizza = 'Margherita' AND nome_cliente = 'Davide';

--10. Contare quante righe sono presenti nella tabella

SELECT COUNT(*) FROM ordine;

--11. Gli ordini che sono di uno specifico giorno

SELECT * FROM ordine 
WHERE data_ordine BETWEEN '2022/01/14 00:00' AND '2022/01/14 23:59'; 

/*
12. Gli ordini che hanno almeno 3 nome diversi di pizza 
    hint: usare clausola "IN"
*/

SELECT * FROM ordine 
WHERE nome_pizza IN('Marinara','Margherita','Capricciosa');

/*
13. Il totale dei prezzi 
    hint: usare la SUM 
*/

SELECT SUM(totale_ordine) AS "Totale ordini" FROM ordine;

--14. Il totale dei prezzi per una singola giornata

SELECT SUM(totale_ordine) FROM ordine
WHERE data_ordine BETWEEN '2022/01/14 00:00' AND '2022/01/14 23:59'; 

--15. La media del totale per ogni ordine

SELECT AVG(totale_ordine) AS media_ordini FROM ordine;

--16. Il massimo ordine di ogni cliente

SELECT nome_cliente, MAX(totale_ordine) FROM ordine GROUP BY nome_cliente; 

--17. Tutti i giorni in cui c'è stato almeno un ordine (solo data no ora e minuti)

SELECT DISTINCT date(data_ordine) FROM ordine;

--18. Tutti gli ordini a più di 6 euro e meno di 8

SELECT totale_ordine FROM ordine
WHERE totale_ordine BETWEEN 6 AND 8; 

--19. Solamente i primi 5 ordini in ordine temporale (dal più recente al più vecchio)

SELECT * FROM ordine ORDER BY data_ordine DESC LIMIT 5; 
