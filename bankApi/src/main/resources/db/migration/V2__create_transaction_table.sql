-- Create table for transactions
CREATE TABLE transaction (
    id SERIAL PRIMARY KEY,
    user_id SERIAL NOT NULL,
    operation VARCHAR(255) NOT NULL,
    date TIMESTAMP NOT NULL,
    amount DOUBLE PRECISION NOT NULL,
    balance DOUBLE PRECISION NOT NULL
);