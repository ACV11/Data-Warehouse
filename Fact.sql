CREATE TABLE sales_fact (LIKE payment);
INSERT INTO sales_fact SELECT * FROM payment;
ALTER TABLE sales_fact DROP COLUMN rental_id;
ALTER TABLE sales_fact DROP COLUMN payment_date;
ALTER TABLE sales_fact DROP COLUMN staff_id;
ALTER TABLE sales_fact ADD COLUMN film_id integer;
ALTER TABLE sales_fact ADD COLUMN store_id integer;
ALTER TABLE sales_fact ADD COLUMN time_id integer;

ALTER TABLE sales_fact ADD CONSTRAINT ref_integ_film FOREIGN KEY (film_id) REFERENCES film_dimension (film_id);
ALTER TABLE sales_fact ADD CONSTRAINT ref_integ_time FOREIGN KEY (time_id) REFERENCES dim_time (time_id);
ALTER TABLE sales_fact ADD CONSTRAINT ref_integ_cust FOREIGN KEY (customer_id) REFERENCES customer_dim (customer_id);
ALTER TABLE sales_fact ADD CONSTRAINT ref_integ_branch1 FOREIGN KEY (store_id) REFERENCES branch_dim (store_id);

ALTER TABLE sales_fact ADD CONSTRAINT pk PRIMARY KEY (payment_id);

ALTER TABLE sales_fact ALTER COLUMN customer_id DROP NOT NULL;

ALTER TABLE sales_fact ALTER COLUMN amount DROP NOT NULL;

INSERT INTO sales_fact (amount, payment_id, store_id, customer_id, film_id, time_id) SELECT RANDOM() * (1000 - 100) + 100, GENERATE_SERIES(1, 250), RANDOM() * (2 - 1) + 1, RANDOM() * (599 - 1) + 1, RANDOM() * (1000 - 1) + 1, RANDOM() * (730-1) +1;




