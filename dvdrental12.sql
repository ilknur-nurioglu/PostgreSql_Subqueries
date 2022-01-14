--film tablosunda film uzunluğu length sütununda gösterilmektedir. Uzunluğu ortalama film uzunluğundan fazla kaç tane film vardır?
SELECT COUNT(*), (SELECT AVG(length) FROM film)
FROM film
WHERE length >
(
	SELECT AVG(length) FROM film
);

--film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?
SELECT COUNT(*), (SELECT MAX(rental_rate) FROM film)
FROM film
WHERE rental_rate= 
(
	SELECT MAX(rental_rate) FROM film
);

--film tablosunda en düşük rental_rate ve en düşün replacement_cost değerlerine sahip filmleri sıralayınız.
SELECT title, (SELECT MIN(rental_rate) FROM film) AS min_rental_rate, (SELECT MIN(replacement_cost) FROM film) AS min_replacement_cost
FROM film
WHERE rental_rate= (SELECT MIN(rental_rate) FROM film) AND replacement_cost= (SELECT MIN(replacement_cost) FROM film);


--payment tablosunda en fazla sayıda alışveriş yapan müşterileri(customer) sıralayınız.
SELECT SUM(amount), customer.first_name, customer.last_name FROM payment
INNER JOIN customer ON payment.customer_id=customer.customer_id
GROUP BY payment.customer_id, customer.first_name, customer.last_name
ORDER BY SUM(amount) desc
LIMIT 1;
