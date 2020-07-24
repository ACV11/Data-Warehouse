CREATE TABLE film_dimension AS SELECT * FROM film NATURAL JOIN film_category;

CREATE TABLE dim_time(
time_id SERIAL primary key,
c_date date not null,
c_year integer,
c_month integer,
c_week integer,
c_qtr integer,
c_day_of_week integer,
c_day_of_year integer);
INSERT INTO dim_time(c_date)
SELECT generate_series(DATE '20050101', DATE '20061231', interval '1' day) as cal_date;
UPDATE dim_time
  SET c_year = EXTRACT(YEAR from c_date),
      c_month = EXTRACT(MONTH from c_date),
      c_week = EXTRACT(WEEK from c_date),
      c_qtr = EXTRACT(QUARTER from c_date),
      c_day_of_week = EXTRACT(DOW from c_date),
      c_day_of_year = EXTRACT(DOY from c_date);

CREATE TABLE customer_dim (LIKE customer);
INSERT INTO  customer_dim SELECT * FROM customer;

CREATE TEMP TABLE temp_table AS SELECT * FROM address NATURAL JOIN city;
CREATE TEMP TABLE temp_table_2 AS SELECT * FROM temp_table NATURAL JOIN country;
CREATE TABLE branch_dim AS SELECT * FROM temp_table_2 NATURAL JOIN store;

ALTER TABLE film_dimension ADD CONSTRAINT film_dimension_pk PRIMARY KEY (film_id);
ALTER TABLE customer_dim ADD CONSTRAINT customer_dim_pk PRIMARY KEY (customer_id);
ALTER TABLE branch_dim ADD CONSTRAINT branch_dim_pk PRIMARY KEY (store_id);




