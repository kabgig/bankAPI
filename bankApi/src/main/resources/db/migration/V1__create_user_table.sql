-- Create the user_balance table
CREATE TABLE user_balance (
    id SERIAL PRIMARY KEY,
    balance DECIMAL(10, 2) NOT NULL
);
INSERT INTO user_balance (id, balance) VALUES
(103,345.50),
(102,1245.50),
(101,32.56);