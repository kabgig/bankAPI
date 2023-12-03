-- Create the user_balance table
CREATE TABLE user_balance (
    id SERIAL PRIMARY KEY,
    balance DECIMAL(10, 2) NOT NULL
);