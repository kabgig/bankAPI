-- Create the user_balance table
CREATE TABLE user_balance (
    id SERIAL PRIMARY KEY,
    balance DECIMAL(10, 2) NOT NULL
);
INSERT INTO user_balance (id, balance) VALUES
(101,345.50),
(102,12410),
(103,124.50),
(104,18.50),
(105,1245.50),
(106,1245.50),
(107,1245.50),
(108,121.50),
(109,12.61),
(110,1240),
(111,120),
(112,32.56);